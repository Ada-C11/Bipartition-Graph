require "set"

def possible_bipartition(dislikes)
  if dislikes.empty?
    return true
  end

  dogz = Set.new()
  doggos = Set.new()

  dislikes.each_with_index { |dislike, i|
    if !dogz.include?(i) && !doggos.include?(i)
      dogz.add(i)

      dislike.each { |dog|
        if dogz.include?(dog)
          return false
        else
          doggos.add(dog)
        end
      }
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
  }

  return true
end
