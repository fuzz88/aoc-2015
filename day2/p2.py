print(sum([sum([x*y*z, 2*(x + y + z - max(x,y,z))]) for x,y,z in [list(map(int, line[:-1].split("x"))) for line in open(0).readlines()]]))
