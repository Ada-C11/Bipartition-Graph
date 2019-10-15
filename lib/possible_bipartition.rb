# I had some help with this from https://www.geeksforgeeks.org/bipartite-graph/,
# but I did figure out some edge cases by myself :)

def possible_bipartition(dislikes)
  if dislikes == []
    return true
  end

  already_grouped = {0 => "a"}
  q = [0]
  num_of_dogs = dislikes.length

  while !q.empty?
    dog = q.shift

    # return false if there is a self-loop
    if dislikes[dog].include?(dog)
      return false
    elsif dislikes[dog].empty?
      dog += 1
      already_grouped[dog - 1] == "a" ? already_grouped[dog] = "a" : already_grouped[dog] = "b"
    end

    num_of_dogs.times do |i|
      if dislikes[dog].include?(i)
        if already_grouped[dog] == already_grouped[i]
          return false
        elsif already_grouped[dog] == "a" && !already_grouped[i]
          already_grouped[i] = "b"
          q << i
        elsif already_grouped[dog] == "b" && !already_grouped[i]
          already_grouped[i] = "a"
          q << i
        end
      end
    end
  end

  return true
end
