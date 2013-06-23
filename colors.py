#!/usr/bin/env python

"""
Program to display ASCII colours and their colour codes on the terminal.

On ubuntu, requires ncurses-term to be installed.
Also, it may be required for the TERM environment variable to be set to
xterm-256color
"""

if __name__ == '__main__':

    import string

    fg = '\033[38;5;'
    bg = '\033[48;5;'

    for i in range(0, 8):
        n = str(string.zfill(i, 3))
        fgstr = fg + n + 'm' + n
        bgstr = bg + n + 'm' 'XXX'
        print fgstr, bgstr, '\033[0m',

    print

    for i in range(8, 16):
        n = str(string.zfill(i, 3))
        fgstr = fg + n + 'm' + n
        bgstr = bg + n + 'm' 'XXX'
        print fgstr, bgstr, '\033[0m',

    print
    print

    for i in range(16, 232, 36):
        for j in range(0, 36, 6):
            for k in range(0, 6):
                n = str(string.zfill(i+j+k, 3))
                fgstr = fg + n + 'm' + n
                bgstr = bg + n + 'm' 'XXX'
                print fgstr, bgstr, '\033[0m',
            print
        print

    for i in range(232, 256, 6):
        for j in range(0, 6):
            n = str(string.zfill(i+j, 3))
            fgstr = fg + n + 'm' + n
            bgstr = bg + n + 'm' 'XXX'
            print fgstr, bgstr, '\033[0m',
        print

