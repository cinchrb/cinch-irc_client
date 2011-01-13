=begin
** Form generated from reading ui file 'ui.ui'
**
** Created: Thu Jan 13 12:46:43 2011
**      by: Qt User Interface Compiler version 4.7.1
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

require 'Qt4'

class Ui_MainWindow
    attr_reader :centralwidget
    attr_reader :verticalLayout
    attr_reader :horizontalLayout
    attr_reader :channellist
    attr_reader :chatarea
    attr_reader :nicklist
    attr_reader :input
    attr_reader :menubar
    attr_reader :statusbar

    def setupUi(mainWindow)
    if mainWindow.objectName.nil?
        mainWindow.objectName = "mainWindow"
    end
    mainWindow.resize(682, 359)
    @centralwidget = Qt::Widget.new(mainWindow)
    @centralwidget.objectName = "centralwidget"
    @verticalLayout = Qt::VBoxLayout.new(@centralwidget)
    @verticalLayout.objectName = "verticalLayout"
    @horizontalLayout = Qt::HBoxLayout.new()
    @horizontalLayout.objectName = "horizontalLayout"
    @channellist = Qt::ListWidget.new(@centralwidget)
    @channellist.objectName = "channellist"
    @sizePolicy = Qt::SizePolicy.new(Qt::SizePolicy::Fixed, Qt::SizePolicy::Expanding)
    @sizePolicy.setHorizontalStretch(0)
    @sizePolicy.setVerticalStretch(0)
    @sizePolicy.heightForWidth = @channellist.sizePolicy.hasHeightForWidth
    @channellist.sizePolicy = @sizePolicy
    @channellist.maximumSize = Qt::Size.new(150, 16777215)

    @horizontalLayout.addWidget(@channellist)

    @chatarea = Qt::TextBrowser.new(@centralwidget)
    @chatarea.objectName = "chatarea"
    @sizePolicy1 = Qt::SizePolicy.new(Qt::SizePolicy::MinimumExpanding, Qt::SizePolicy::Expanding)
    @sizePolicy1.setHorizontalStretch(3)
    @sizePolicy1.setVerticalStretch(0)
    @sizePolicy1.heightForWidth = @chatarea.sizePolicy.hasHeightForWidth
    @chatarea.sizePolicy = @sizePolicy1

    @horizontalLayout.addWidget(@chatarea)

    @nicklist = Qt::ListWidget.new(@centralwidget)
    @nicklist.objectName = "nicklist"
    @nicklist.enabled = true
    @sizePolicy.heightForWidth = @nicklist.sizePolicy.hasHeightForWidth
    @nicklist.sizePolicy = @sizePolicy
    @nicklist.maximumSize = Qt::Size.new(150, 16777215)

    @horizontalLayout.addWidget(@nicklist)


    @verticalLayout.addLayout(@horizontalLayout)

    @input = Qt::LineEdit.new(@centralwidget)
    @input.objectName = "input"

    @verticalLayout.addWidget(@input)

    mainWindow.centralWidget = @centralwidget
    @menubar = Qt::MenuBar.new(mainWindow)
    @menubar.objectName = "menubar"
    @menubar.geometry = Qt::Rect.new(0, 0, 682, 25)
    mainWindow.setMenuBar(@menubar)
    @statusbar = Qt::StatusBar.new(mainWindow)
    @statusbar.objectName = "statusbar"
    mainWindow.statusBar = @statusbar

    retranslateUi(mainWindow)

    Qt::MetaObject.connectSlotsByName(mainWindow)
    end # setupUi

    def setup_ui(mainWindow)
        setupUi(mainWindow)
    end

    def retranslateUi(mainWindow)
    mainWindow.windowTitle = Qt::Application.translate("MainWindow", "MainWindow", nil, Qt::Application::UnicodeUTF8)
    end # retranslateUi

    def retranslate_ui(mainWindow)
        retranslateUi(mainWindow)
    end

end

module Ui
    class MainWindow < Ui_MainWindow
    end
end  # module Ui

