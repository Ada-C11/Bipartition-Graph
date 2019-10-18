def visit_node(stack, nodes, key, group)
  node = { :key => key, :group => group }
  nodes[key] = node
  stack.append(node)
end

def possible_bipartition(dislikes)
  return true if dislikes == []
  stack = []
  nodes = Array.new(dislikes.length)

  dislikes.length.times do |curr|
    visit_node(stack, nodes, curr, 0) if !nodes[curr]
    until stack.empty?
      curr_node = stack.pop()
      curr_dislikes = dislikes[curr_node[:key]]
      curr_group = curr_node[:group]

      curr_dislikes.each do |node|
        if nodes[node]
          return false if nodes[node][:group] == curr_group
        else
          group = (curr_group + 1) % 2
          visit_node(stack, nodes, node, group)
        end
      end
    end
  end
  return true
end
