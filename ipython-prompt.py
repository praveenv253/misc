#!/usr/bin/env python3

# This file amends the IPython prompt to have the classic python style.
# Copy this file to .ipython/profile_default/startup, with the name
# 00-classic-prompt.py

from __future__ import print_function, division

from IPython.terminal.prompts import ClassicPrompts

ip = get_ipython()
ip.prompts = ClassicPrompts(ip)
ip.separate_in = ''
