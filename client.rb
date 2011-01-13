$:.unshift File.expand_path(File.dirname(__FILE__))

require "Qt4"
require "cinch"
require "./ui.rb"
Thread.abort_on_exception = true

## configuration
SERVER = "irc.freenode.net"
NICK   = "cinch_irc"
CHANNEL = "#cinch-bots"
## end of configuration

module IRCClient
  class UserlistUpdater
    include Cinch::Plugin

    listen_to :join, method: :on_join
    listen_to :part, :quit, :kill, method: :on_part
    def on_join(m)
      $application.write_message "| #{m.user.nick} joined the channel"
      if m.user == bot
        m.channel.users.each_key do |user|
          $application.add_nick_to_nicklist(user.nick)
        end

        $application.add_channel_to_channellist(m.channel.name)
      else
        $application.add_nick_to_nicklist(m.user.nick)
      end
    end

    def on_part(m)
      $application.remove_nick_from_nicklist(m.user.nick)
    end
  end

  class StatusMessages
    include Cinch::Plugin

    listen_to :connect, method: :on_connect
    listen_to :part, :quit, :kill, method: :on_part
    def on_part(m)
      $application.write_message "| #{m.user.nick} left the channel."
    end

    def on_connect(m)
      $application.write_message "[Connected]"
    end
  end

  class IncomingMessages
    include Cinch::Plugin

    listen_to :message
    def listen(m)
      $application.write_message "&lt;#{m.user.nick}&gt; #{m.message}"
    end
  end
end

class Application
  def initialize
    @a = Qt::Application.new(ARGV)
    @u = Ui_MainWindow.new
    @w = Qt::MainWindow.new
    @u.setupUi(@w)

    # qtruby will only run other ruby threads when a signal gets fired,
    # so we are using this timer to create a signal every 20ms. It's an
    # ugly workaround for a stupid qtruby limitation, but since this is
    # only a PoC it's okay.
    @timer = Qt::Timer.new(@w)
    @timer.interval = 20
    @timer.connect(SIGNAL :timeout) {}


    # send messages to the channel
    @u.input.connect(SIGNAL :returnPressed) do
      text = @u.input.text
      write_message "&lt;#{@connection.nick}&gt; #{text}"
      @connection.channel_manager.find(CHANNEL).send(text)
      @u.input.clear
    end

    @connection = Cinch::Bot.new do
      configure do |c|
        c.nick = NICK
        c.server = SERVER
        c.channels = [CHANNEL]
        c.plugins.plugins = [IRCClient::UserlistUpdater, IRCClient::StatusMessages, IRCClient::IncomingMessages]
      end
    end
  end

  def write_message(msg)
    @u.chatarea.insert_html(msg + "<br>")
  end

  def add_nick_to_nicklist(nick)
    @u.nicklist.add_item nick
  end

  def remove_nick_from_nicklist(nick)
    @u.nicklist.find_items(nick, Qt::MatchFixedString).each do |item|
      @u.nicklist.take_item(@u.nicklist.row(item))
    end
  end

  def add_channel_to_channellist(channel)
    @u.channellist.add_item channel
  end

  def start
    Thread.new do
      write_message "[Connecting...]"
      @connection.start
    end

    @w.show
    @timer.start
    @a.exec
  end
end

if $0 == __FILE__
  $application = Application.new
  $application.start
end
