
def possible_bipartition(dislikes)
  return true if dislikes.empty? || dislikes.length < 2

  # group_hash includes visited & queued nodes, key is the node & value is the group
  # group can be 1 or 2
  group_hash = {}
  q = []

  # add first, existant node to q & group_hash
  count = 0
  i = 0
  until count == 1 && i < dislikes.length
    if dislikes[i] != []
      q << i
      group_hash[i] = 1
      count += 1
    end
    i += 1
  end

  while !q.empty?
    dislikes[q[0]].each do |disliked_dog|
      parent_group = group_hash[q[0]]

      if group_hash[disliked_dog]
        return false if group_hash[disliked_dog] == parent_group
      elsif !group_hash[disliked_dog]
        q << disliked_dog
        parent_group == 1 ? group_hash[disliked_dog] = 2 : group_hash[disliked_dog] = 1
      end
    end
    q.shift
  end
  return true
end
