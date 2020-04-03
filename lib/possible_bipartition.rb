def is_visited(visited_list, current_puppy)
  return !visited_list[current_puppy].nil?
end

def no_more_enemies(current, enemy_count)
  return current >= enemy_count
end

def mark_as_visited(visited_list, current_puppy, current_group_color)
  visited_list[current_puppy] = current_group_color
end

def incompatible_groups(visited, puppy_1, puppy_2)
  return visited[puppy_1] == visited[puppy_2]
end

# time complexity: O(E) where E is the number of edges in the graph
# space complexity: O(N) where N is the number of nodes in the graph,
#                   because the nodes are stored in the visited hash
#                   and the nodes are stored in the stack
def possible_bipartition(dislikes)
  puppies_count = dislikes.length()
  return true if puppies_count <= 0

  stack = [0]
  visited = {} # puppy => group_color
  current_group_color = false
  num_puppies_checked = 0

  while !stack.empty?
    current_puppy = stack.last
    mark_as_visited(visited, current_puppy, current_group_color)
    current_group_color = !current_group_color

    enemy_puppies = dislikes[current_puppy]
    enemy_count = enemy_puppies.length()
    if enemy_count > 0
      current_enemy = 0
      found_unvisited = false
      until found_unvisited || no_more_enemies(current_enemy, enemy_count)
        enemy_puppy = enemy_puppies[current_enemy]
        if is_visited(visited, enemy_puppy)
          return false if incompatible_groups(visited, enemy_puppy, current_puppy)
        else
          stack << enemy_puppy
          found_unvisited = true
        end
        current_enemy += 1
      end
    end

    if !found_unvisited
      # if all enemies have been visited, or there are none,
      # puppy has been checked; remove it from the stack
      stack.pop()
      num_puppies_checked += 1

      if stack.empty? && num_puppies_checked < puppies_count
        # add the next puppy in the dislikes array to the stack
        stack << num_puppies_checked
      end
    end
  end

  return true
end
