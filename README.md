This is a PoC IRC client written in Ruby, using the Cinch IRC library
and Qt4.

The main intention of this client is to demonstrate that the Cinch
library, while actually being a framework for writing bots, can also
be used for writing other kinds of applications, including clients.

# Various disclaimers
This application is not supposed to offer a fully working IRC client.
In fact it is very limited and only supports a very basic subset of
IRC. This is not due to missing functionality in Cinch itself but
caused by the very nature of a PoC. It would be easily possible to
extend this client to write a client similar to e.g. XChat.

Additionally, this is my first application written using the Qt
framework and may as such contain various code smells and bad design
choices. Again, the only intention of this piece of code is to
demonstrate possibilities offered by Cinch, not to teach how to write
GUI applications in Ruby.

# Requirements
- The Cinch framework (gem name: cinch)
- Qt4 (for example by using "korundum" or the gem "qtbindings")

# Configuration
The client only supports a single connection and joining a single
channel. The configuration is done by editing three constants in the
head of client.rb

# Running the client
Simply run the client.rb file. You will be presented with a window
that contains, from left to right, top to bottom:
- a channel list, which lists all currently joined channels (only one
  is supported so far)
- The chat area, which will contain status and chat messages
- The nick list, which lists all users currently in the channel
- The input bar to send messages. (Press _return_ to send a message)

# Features
- Sending and receiving of messages
- Notification about joining and leaving users
  - the user list will be updated as well

# A note on the screenshot
The screenshot (screenshot.png) shows really poor font rendering. This
is not the fault of Qt but my system configuration which I did not
bother to adjust for Qt.

# Known bugs
- It can happen that the client will not update until an event is
  fired, e.g. by moving the mouse or resizing the window. This is
  caused by us blatantly modifying the UI from threads other than the
  main thread, which is a no-go with most GUI toolkits.
