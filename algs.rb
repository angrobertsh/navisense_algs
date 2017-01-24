require 'byebug'

# f(0)=0f(1)=1f(n)=f(n-1)+f(n-2)
# f(0) = 0 * f(1) = f(n) = f(n-1) + f(n-2)

def mystery(n)
  0
end

# Please implement a program that
# lists the nodes of a random binary tree by nodes at the same depth.

# list the sibling nodes of a binary tree


def siblings(n)
  # first find depth.
  depth = 0
  current = n
  while(n.parent)
    current = current.parent
    depth += 1
  end
  # edge case it's root
  if(depth == 0)
    return [current.value]
  end
  # go down to the right level and concat the nodes
  return [siblingshelper(current.left, depth-1)].concat([siblingshelper(current.right, depth-1)])
end

def siblingshelper(current, depth)
  # unbalanced tree
  if(current == nil)
    return
  end

  # at the right depth
  if(depth == 0)
    return current.value
  end

  return [siblingshelper(current.left, depth-1)].concat([siblingshelper(current.right, depth-1)])

end


def siblings(n)
  # first find depth.
  depth = 0
  current = n
  while(n.parent)
    current = current.parent
    depth += 1
  end
  # go down to the right level and concat the nodes
  return siblingshelper(current, depth)
end

def siblingshelper(current, depth)
  # unbalanced tree
  if(current == nil)
    return
  end

  # at the right depth
  if(depth == 0)
    return current.value
  end

  return [siblingshelper(current.left, depth-1)].concat([siblingshelper(current.right, depth-1)])
end


# If the finishing point is “n” spaces away from the starting point,
# please implement a program that calculates how many possible ways are there
# to arrive exactly at the finishing point.

def perm_sum(target)
# manually enumerate subsets of 1-6
# 1(1) [1]
# 2(2) [1, 1] [2]
# 3(4) [1, 2] [2, 1] [1, 1, 1] [3]
# 4(8) [4] [2, 2] [1, 3] [3, 1] [1, 1, 1, 1] [1, 2, 1] [2, 1, 1] [1, 1, 2]
# 5(16) [5]
# [4, 1] [1, 4]
# [3, 2] [2, 3]
# [2, 2, 1] [2, 1, 2] [1, 2, 2] [1, 3, 1] [3, 1, 1] [1, 1, 3]
# [1, 1, 1, 2], [1, 1, 2, 1], [1, 2, 1, 1] [2, 1, 1, 1]
# [1, 1, 1, 1, 1]
# 6(32) [6]
# [5, 1] [1, 5], [3, 3] [4, 2] [2, 4]
# [1, 1, 4] [1, 4, 1] [4, 1, 1], [1, 3, 2], [1, 2, 3], [3, 2, 1], [3, 1, 2] [2, 3, 1], [2, 1, 3], [2, 2, 2]
# [1, 1, 1, 3] [1, 1, 3, 1] [1, 3, 1, 1] [3, 1, 1, 1] [1, 2, 2, 1] [1, 1, 2, 2] [2, 1, 1, 2] [2, 2, 1, 1]
# [1, 2, 1, 2] [2, 1, 2, 1]
# [1, 1, 1, 1, 2], [1, 1, 1, 2, 1], [1, 1, 2, 1, 1], [1, 2, 1, 1, 1] [2, 1, 1, 1, 1]
# [1, 1, 1, 1, 1, 1]

# 7 [6, 1] [1, 6]
# [1, 5, 1] [1, 1, 5], [5, 1, 1], [1, 2, 4], [1, 4, 2], [4, 2, 1], [2, 4, 1]

  perm_sum_helper([], target)

end

def perm_sum_helper(seq, target)

  if(seq.empty? == false)
    if(seq.inject(:+) == target)
      return 1
    end

    if(seq.inject(:+) > target)
      return
    end
  end

  seqs = 0
  dice = 1

  while(dice < 7)
    thisseq = perm_sum_helper((seq + [dice]), target)
    if(thisseq != nil)
      seqs += thisseq
    end
    dice += 1
  end

  return seqs

end

def perm_sum_helper2(seq, target)

  if(seq.empty? == false)
    if(seq.inject(:+) == target)
      return seq
    end

    if(seq.inject(:+) > target)
      return
    end
  end

  dice = 1
  seqs = []

  while(dice < 7)
    thisseq = perm_sum_helper2((seq + [dice]), target)
    if(thisseq != nil)
      seqs.push(thisseq)
    end
    dice += 1
  end

  return seqs

end


# puts perm_sum(11) / 2
# puts perm_sum(10) - perm_sum(11) / 2
# puts perm_sum(3)
#
# puts perm_sum(11)
# puts perm_sum(12) / 2
# puts perm_sum(11) - perm_sum(12) / 2
# puts perm_sum(4)
#
# puts perm_sum(12)
# puts perm_sum(13) / 2
# puts perm_sum(12) - perm_sum(13) / 2
# puts perm_sum(5)
#
# puts perm_sum(13)
# puts perm_sum(14) / 2
# puts perm_sum(13) - perm_sum(14) / 2
# puts perm_sum(6)
#
# puts perm_sum(14)
# puts perm_sum(15) / 2
# puts perm_sum(14) - perm_sum(15) / 2
# puts perm_sum(7)
#
# puts perm_sum(15)
# puts perm_sum(16) / 2
# puts perm_sum(15) - perm_sum(16) / 2 + perm_sum(1)
# puts perm_sum(8)
#
# puts perm_sum(16)
# puts perm_sum(17) / 2
# puts perm_sum(16) - perm_sum(17) / 2 + perm_sum(2)
# puts perm_sum(9)
#
# puts perm_sum(17)
# puts perm_sum(18) / 2
# puts perm_sum(17) - perm_sum(18) / 2 + perm_sum(3)
# puts perm_sum(10)
#
# puts perm_sum(18)
# puts perm_sum(19) / 2
# puts perm_sum(18) - perm_sum(19) / 2 + perm_sum(4)
# puts perm_sum(11)


# 2(f(n) - f(n-7) + f(n-14)) = f(n+1)
