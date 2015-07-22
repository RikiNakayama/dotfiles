# -*- coding: utf-8 -*-
import sys

def calc_width(x):
    return len(x.encode('utf-8')) > 1 and 2 or 1

if __name__ == "__main__":
    context = sys.stdin.read().decode('utf-8')
    print sum(map(calc_width, context)) - 1
