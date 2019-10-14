
def possible_bipartition(dislikes)
  return true if dislikes == []
  groups = { "A" => "B", "B" => "A" }

  # finds first non-empty dislike array
  i = 0
  while dislikes[i].empty?
    i += 1
  end

  # assigns group A to first number with a dislike array and pushes to stack
  groups[i] = "A"
  stack = [i]

  until stack.empty?
    num = stack.pop
    num_group = groups[num]
    num_dislikes = dislikes[num]
    num_dislikes.each do |num_dislike|
      if groups[num_dislike] == nil
        groups[num_dislike] = groups[num_group]
        stack.push(num_dislike)
      elsif groups[num_dislike] == num_group
        return false
      end
    end
  end
  return true
end
