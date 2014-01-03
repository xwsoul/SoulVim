# -*- coding=utf-8 -*-
'''
Author: Wayne Xue <xwsoul@gmail.com>
Date: 2014-01-03
Sublime Text Compat Script
'''

import sys
import vim


def status_message(msg):
    '''output message'''
    print msg


def error_message(err):
    '''output error'''
    sys.stderr.write(err)


def load_settings(paramHolder=None):
    '''load settings'''
    return vim.vars


def packages_path():
    '''package path'''
    return vim.vars['install_packages_dir']
