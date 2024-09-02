#!/usr/bin/python3

floor = 0
directions = {")": -1, "(": 1}
for i, c in enumerate([line[:-1] for line in open(0).read()]):
    floor += directions[c]
    if floor == -1:
        print(i+1)
        break
