print(sum([sum(area)*2 + min(area) for area in [(x*y, x*z, y*z) for x,y,z in [list(map(int, line.split("x"))) for line in open(0).readlines()]]]))

