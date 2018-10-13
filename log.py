#!/usr/bin/env python3

from __future__ import print_function, division

import sys
import os
import tempfile
from subprocess import call
import argparse
import datetime as dt
import time
import yaml

HOME_DIR = os.environ['HOME']
LOGFILE = os.path.join(HOME_DIR, 'documents', '.logs', 'logfile.yml')
EDITOR = os.environ.get('EDITOR', 'vim')


# Parse arguments and call the appropriate function
if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Create a log message')
    parser.add_argument('-d', '--display', dest='disp', action='store_true',
                        help='List all log messages')
    parser.add_argument('-b', '--blog', dest='blog', action='store_true',
                        help='Also create a blog post under logs')
    parser.add_argument('-t', '--title', dest='title', default='Log message',
                        metavar='<title>', help='Title of the log message')
    parser.add_argument('message', nargs=argparse.REMAINDER,
                        metavar='<log-message>', help='The log message itself')
    args = parser.parse_args()

    if args.disp:
        if not os.path.isfile(LOGFILE):
            print('Cannot open logfile at %s' % LOGFILE)
            sys.exit(1)
        with open(LOGFILE) as f:
            print(f.read())
        sys.exit(0)

    if not args.message:
        with tempfile.NamedTemporaryFile(mode='w+', suffix=".tmp") as temp:
            call([EDITOR, temp.name])
            message = temp.read().strip()
    else:
        message = ' '.join(args.message).strip()

    if not message.strip():
        print('Empty message. Not writing anything.')
        sys.exit(0)

    gmtoffset = time.localtime().tm_gmtoff
    now = dt.datetime.now(dt.timezone(dt.timedelta(seconds=gmtoffset)))
    formatted_time = now.strftime('%Y-%m-%d %H:%M:%S %z')

    # Parse message text for tags and blog text
    tags = ['log message', ]
    while message[0] == '[':
        [tag, message] = message.split(']', 1)
        tags.append(tag[1:])
        message = message.strip()

    loginfo = [{'time': formatted_time,
                'title': args.title,
                'message': message,
                'tags': tags},]
    with open(LOGFILE, 'a') as f:
        f.write(yaml.dump(loginfo, default_flow_style=False))

    if args.blog:
        # Construct blog post
        filedata = ('---\n'
                    'layout: blog\n'
                    'title: ' + args.title + '\n'
                    'date: ' + formatted_time + '\n'
                    'day: ' + now.strftime('%A') + '\n'
                    'tags:\n')
        for tag in tags:
            filedata += '  - ' + tag + '\n'
        filedata += '---\n\n' + message

        # Generate unique filename
        filename = now.date().isoformat() + '-log-message.md'
        filepath = os.path.join(HOME_DIR, 'repos', 'website-jekyll', 'logs',
                                '_posts', filename)
        sameday_msg_index = 0
        while os.path.isfile(filepath):
            sameday_msg_index += 1
            filename = now.date().isoformat() + ('-log-message-%d.md'
                                                 % sameday_msg_index)
            filepath = os.path.join(HOME_DIR, 'repos', 'website-jekyll', 'logs',
                                    '_posts', filename)

        # Write file
        with open(filepath, 'w') as f:
            f.write(filedata)
