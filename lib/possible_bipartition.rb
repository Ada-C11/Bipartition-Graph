require "pry"

# I looked at the leetcode solution in Python 
# (https://leetcode.com/problems/possible-bipartition/solution/) 
# to get an idea of how to turn the list of dislikes into a graph, 
# but chose to implement a breadth-first solution instead

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
      if queue.empty? && node < graph.keys.max
        queue.push(node + 1)
      end
      binding.pry
    end  
    return true
end


def build_graph(dislikes)
  nodes = Hash.new {|h,k| h[k] = [] } #had to look up how to do this on StackOverflow
    dislikes.each do |dislike|
        dislike.each do |node|
          nodes[node] += dislike - [node] 
        end
    end
    return nodes
end

