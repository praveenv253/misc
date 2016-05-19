#!/usr/bin/env python3

from __future__ import print_function, division

import sys
import pickle

import numpy as np
import matplotlib.pyplot as plt

if __name__ == '__main__':
    usage = 'Usage: %s <filename.mplfig>' % sys.argv[0]

    if len(sys.argv) != 2:
        sys.exit(usage)

    if sys.argv[1] in ['help', '-h', '--help']:
        print(usage)
        sys.exit(0)
    else:
        f = open(sys.argv[1], 'rb')
        fig = pickle.load(f)
        plt.show()
