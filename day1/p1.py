#!/usr/bin/python3

print(sum([1 if i == "(" else -1 for i in open(0).read()[:-1]]))
