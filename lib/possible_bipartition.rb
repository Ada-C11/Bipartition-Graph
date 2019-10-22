require "set"

def possible_bipartition(dislikes)
  if dislikes.empty?
    return true
  end

  dogz = Set.new()
  doggos = Set.new()

  i = 0
  return bipartition_helper(i, dislikes, dogz, doggos)
end

def bipartition_helper(i, dislikes, dogz, doggos)
  while i < dislikes.length
    dislike = dislikes[i]
    if !dogz.include?(i) && !doggos.include?(i)
      dogz1 = dogz.clone()
      doggos1 = doggos.clone()

      dogz1.add(i)
      doggos.add(i)

      return bipartition_helper(i, dislikes, dogz1, doggos1) || bipartition_helper(i, dislikes, dogz, doggos)
    elsif dogz.include?(i)
      dislike.each { |dog|
        if dogz.include?(dog)
          return false
        else
          doggos.add(dog)
        end
      }
    elsif doggos.include?(i)
      dislike.each { |dog|
        if doggos.include?(dog)
          return false
        else
          dogz.add(dog)
        end
      }
    end

    i += 1
  end
  return true
end
