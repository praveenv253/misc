#!/usr/bin/env python3

from __future__ import print_function, division

import sys
import os
import tempfile
from subprocess import call
import argparse

HOME_DIR = os.environ['HOME']
LOGFILE = os.path.join(HOME_DIR, 'Documents', '.logs', 'logfile')
EDITOR = os.environ.get('EDITOR', 'vim')


# Parse arguments and call the appropriate function
if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Create a log message')
    parser.add_argument('-d', '--display', dest='disp', action='store_true',
                        help='List all log messages')
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
        sys.exit()

    import datetime as dt
    import time
    gmtoffset = time.localtime().tm_gmtoff
    now = dt.datetime.now(dt.timezone(dt.timedelta(seconds=gmtoffset)))

    import yaml
    loginfo = [{'time': now.isoformat(sep=' ', timespec='seconds'),
                'title': args.title,
                'message': message},]
    with open(LOGFILE, 'a') as f:
        f.write(yaml.dump(loginfo, default_flow_style=False))
