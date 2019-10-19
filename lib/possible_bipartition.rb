
def possible_bipartition(dislikes)
  return true if dislikes.length < 2

  i = 0
  color = "blue"
  q = []
  nodes_hash = {}

  dislikes.each do |dislike|
    q.unshift(i) if !nodes_hash[i]
    nodes_hash[i] = color
    while !q.empty?
      current = q.pop
      dislikes[current].each do |neighbor|
        return false if nodes_hash[neighbor] == nodes_hash[current]
        if !nodes_hash[neighbor]
          nodes_hash[current] == "blue" ? color = "green" : color = "blue"
          nodes_hash[neighbor] = color
          q.unshift(neighbor)
        end
      end
    end
    i += 1
  end
  return true
end
