# -*- coding=utf-8 -*-
'''
Author: Wayne Xue <xwsoul@gmail.com>
Date: 2014-01-03
Sublime Text Plugin Compat Script
'''

import vim


class TextCommand(object):
    """sublime_plugin.TextCommand"""

    def __init__(self):
        super(TextCommand, self).__init__()
        self.view = TextCommandView()


class TextCommandView(object):
    '''Compat with st plugin view'''

    def __init__(self):
        '''init'''
        super(TextCommandView, self).__init__()

    def file_name(self):
        '''sublime_plugin.view.file_name()'''
        return vim.current.buffer.name

    def file_type(self):
        '''file type'''
        return vim.current.buffer.options["filetype"]
