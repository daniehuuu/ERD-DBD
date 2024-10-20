import random
from group_info import nombres
from tabulate import tabulate

def distribute_indices(solved_array, total_indices, num_parts=7):
    # Initialize the parts
    parts = [[] for _ in range(num_parts)]
    
    # Distribute the indices in a round-robin fashion, skipping the solved ones
    idx = 0
    for i in range(1, total_indices + 1):
        if i not in solved_array:  # Skip solved indices
            parts[idx % num_parts].append(i)
            idx += 1  # Only increment the index when adding to a part
    
    return parts

# Example usage:
solved_array = [1, 5, 8, 9, 13]
result = distribute_indices(solved_array, 22)

table_data = []
for i, part in enumerate(result):
    if nombres:
        name = random.choice(nombres)

        while i <= 2 and (name == "Luis" or name == "Masaru"):
            name = random.choice(nombres)
            
        nombres.remove(name)
        table_data.append([i + 1, name, part])
    else:
        table_data.append([i + 1, "Unnamed part", part])

# Display as a table
# https://pypi.org/project/tabulate/
print(tabulate(table_data, headers=["Parte #", "Encargado", "Ejercicios"], tablefmt="github"))
