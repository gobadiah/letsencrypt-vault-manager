#!/usr/bin/python

import datetime
import sys

for line in sys.stdin:
    d = datetime.datetime.strptime(line.rstrip()[9:-4], '%b %d %H:%M:%S %Y')
    x = (d - datetime.datetime.utcnow())
    print '%d' % (x.seconds + x.days * 24 * 3600)
