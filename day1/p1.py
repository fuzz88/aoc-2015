#!/usr/bin/python3

print(sum([1 if char == "(" else -1 for char in open(0).read()[:-1]]))
