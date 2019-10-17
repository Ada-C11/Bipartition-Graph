#using bfs
def possible_bipartition(dislikes)
  if dislikes == []
    return true
  end
  compat = {}
  dislikes.each_with_index do |neighbors, index|
    bfs(dislikes, compat, index)
  end
  return true
end

def bfs(dislikes, compat, index)
  q = []
  cur = index
  q << cur

  while !q.empty?
    cur = q.shift

    if !compat[cur]
      color = "red"
    else
      color = compat[cur]
    end

    dislikes[cur].each do |elem|
      if color == compat[elem]
        return false
      elsif color == "red" && !compat[elem]
        compat[elem] = "blue"
        q << elem
      elsif color == "blue" && !compat[elem]
        compat[elem] = "red"
        q << elem
      end
    end
  end
end
