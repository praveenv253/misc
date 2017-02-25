#!/usr/bin/env python3

from time import strptime

if __name__ == '__main__':
    logfile = '/home/praveen/documents/.logs/logfile'
    f = open(logfile, 'r')
    data = f.read()
    f.close()

    data = data[:-1]
    log_messages = data.split('\n\n')

    # Folder to put all the posts in
    dest_dir = '/home/praveen/log-posts/'

    for message in log_messages:
        print(message)
        (metadata, message_text) = message.split('\n')

        # Parse metadata for date and time info to construct filename
        [day, textdate, time, timezone] = metadata.split(' | ')
        [date, textmonth, year] = textdate.split()
        month = strptime(textmonth, '%b').tm_mon
        yyyymmdd = year + '-' + str(month).zfill(2) + '-' + date
        timezone = timezone[3:]
        filename = yyyymmdd + '-log-message.markdown'

        # Parse message text for tags and blog text
        tags = ['log message', ]
        while message_text[0] == '[':
            [tag, message_text] = message_text.split('] ', 1)
            tags.append(tag[1:])

        # Construct blog post
        filedata = ('---\n'
                    'layout: blog\n'
                    'title: Log Message\n'
                    'date: ' + yyyymmdd + ' ' + time + ' ' + timezone + '\n'
                    'day: ' + day + '\n'
                    'tags:\n')
        for tag in tags:
            filedata += '  - ' + tag + '\n'
        filedata += '---\n\n' + message_text

        # Write file
        f = open(dest_dir + filename, 'w')
        f.write(filedata)
        f.close()
