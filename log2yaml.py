#!/usr/bin/env python3

"""
Script to convert old C-style logs into YAML format.
"""

from __future__ import print_function, division

from time import strptime
import yaml


if __name__ == '__main__':
    logfile = '/home/praveen/documents/.logs/logfile'

    f = open(logfile, 'r')
    data = f.read()
    f.close()

    data = data[:-1]
    log_messages = data.split('\n\n')

    for message in log_messages:
        (metadata, message_text) = message.split('\n')

        # Parse metadata for date and time info to construct filename
        [day, textdate, time, timezone] = metadata.split(' | ')
        [date, textmonth, year] = textdate.split()
        month = strptime(textmonth, '%b').tm_mon
        yyyymmdd = year + '-' + str(month).zfill(2) + '-' + date
        timezone = timezone[3:]
        timezone = timezone[:3] + ':' + timezone[3:]
        title = 'Log message'

        # Parse message text for tags and blog text
        tags = ['log message', ]
        while message_text[0] == '[':
            [tag, message_text] = message_text.split(']', 1)
            tags.append(tag[1:])
            message_text = message_text.strip()

        loginfo = [{'time': yyyymmdd + ' ' + time + timezone,
                    'title': title,
                    'message': message_text,
                    'tags': tags},]
        print(yaml.dump(loginfo, default_flow_style=False), end='')
