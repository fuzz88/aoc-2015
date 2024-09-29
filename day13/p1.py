import re
from collections import defaultdict

persons = defaultdict(dict)


#file_name = "sample1.txt"
file_name = "test1.txt"


with open(file_name) as f:
    data = f.readlines()
    for line in data:
        m = re.match(r"^(\w+) would (gain|lose) (\d*).* (\w+).", line)
        sign = -1 if m.group(2) == "lose" else 1
        persons[m.group(1)][m.group(4)] = int(m.group(3)) * sign


names = list(persons.keys())
persons["Victoria"] = {}
for name in names:
    persons["Victoria"][name] = 0
    persons[name]["Victoria"] = 0

print()
for person, value in persons.items():
    print(f"{person}\n   {value}")


def next_happiest(person):
    max_happiness = -30000
    happiest = None
    neighbours = persons[person]
    for neighbour in neighbours:
        if neighbour not in table:
            current_happiness = neighbours[neighbour] + persons[neighbour][person]
            if current_happiness > max_happiness:
                happiest = neighbour
                max_happiness = neighbours[neighbour] + persons[neighbour][person]
    return happiest


def arrange_table(first_person, table):
    table.append(first_person)
    next_person = first_person
    for _ in range(len(persons) - 1):
        next_person = next_happiest(next_person)
        table.append(next_person)

def table_happiness(table):
    total_happiness = 0
    for index, person in enumerate(table):
        current_person = table[index]
        next_person = table[index + 1] if index != len(table) - 1 else table[0] 
        h1 = persons[current_person][next_person]
        h2 = persons[next_person][current_person]
        total_happiness = total_happiness + h1 + h2
    return total_happiness

print()

for person in persons:
    table = []
    arrange_table(person, table)
    happiness = table_happiness(table)
    print("table:", table)
    print(happiness)

