#!/usr/bin/python3

floor = 0
d = {")": -1, "(": 1}
for i, c in enumerate([i for i in open(0).read()]):
    floor += d[c]
    if floor == -1:
        print(i+1)
        break
