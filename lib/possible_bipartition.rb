# I tried my best! All the test pass except for number 4. I know that the problem
# is that I should be moving through the dislikes as they appear instead of just
# linearly. However, for whatever when I tried using a stack and popping off the 
# values, it didnt alter my stack--meaning the stack grew in length and I was 
# trapped in a loop.  

def possible_bipartition(dislikes)
  outer_length = dislikes.length
  return true if outer_length <= 2

  groupA = {}
  groupB = {}

  outer_length.times do |x|
    if dislikes[x].length == 0
      next
    end

    other = 'B'
    if groupA[x] || groupB[x]
      other = groupA[x] ? 'B' : 'A'
    elsif !groupA[x] && !groupB[x] 
      groupA[x] = 1
    else
      groupB[x] = 1
      other = 'A'
    end
    
    dislikes[x].each do |i|
      if other == 'B'
        return false if groupA[i]
        groupB[i] = 1
      elsif other == 'A'
        return false if groupB[i]
        groupA[i] = 1
      end
    end
  end

  return true
end