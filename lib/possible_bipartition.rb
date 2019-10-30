def possible_bipartition(dislikes)
    graph = build_graph(dislikes)
    # start with an arbitrary node of the graph, 
    # assuming all nodes have at least one edge
    grouped = {graph.keys[0] => true}
    queue = [graph.keys[0]]
    
    # using a bfs approach, set all neighbor nodes to the opposite label
    # and add them to the queue if they haven't been visited
    # return false if a neighbor has the same label as the current node
    while !queue.empty?
      node = queue.shift()
      graph[node].each do |neighbor|
        if grouped[neighbor] == nil
          grouped[neighbor] = !grouped[node]
          queue.push(neighbor)
        elsif grouped[neighbor] == grouped[node]
          return false
        end     
      end        
    end  
    return true
end



def build_graph(dislikes)
  nodes = Hash.new {|h,k| h[k] = [] }
    dislikes.each do |dislike|
        dislike.each do |node|
          nodes[node] += dislike - [node]
        end
    end
    return nodes
end

