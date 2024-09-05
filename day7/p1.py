import re
from functools import cache

with open("test1.txt") as f:
    lines = f.readlines()


scheme = {}
for line in lines:
    m = re.match(r"(.*) -> (.*)", line)
    scheme[m[2]] = m[1]


@cache
def solve(wire):
    try:
        scheme[wire]
    except KeyError:
        return int(wire)
    expr = scheme[wire].split()
    if len(expr) == 1:
        return solve(expr[0])
    if len(expr) == 2:
        return ~solve(expr[1]) & 0xFFFF
    if len(expr) == 3:
        if expr[1] == "OR":
            return solve(expr[0]) | solve(expr[2]) & 0xFFFF
        if expr[1] == "AND":
            return solve(expr[0]) & solve(expr[2]) & 0xFFFF
        if expr[1] == "LSHIFT":
            return solve(expr[0]) << solve(expr[2]) & 0xFFFF
        if expr[1] == "RSHIFT":
            return solve(expr[0]) >> solve(expr[2]) & 0xFFFF


if __name__ == "__main__":
    b = solve("a")
    print(b)
    scheme["b"] = str(b)
    solve.cache_clear()
    print(solve("a"))
