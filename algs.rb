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

def perm_sum(n)
# find all the subsets that get you to n

# constraint: subsets include numbers from 1-6

# sum them


end
