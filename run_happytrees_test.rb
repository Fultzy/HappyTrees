
#1. Create a binary search tree from an array of random numbers (`Array.new(15) { rand(1..100) }`)
#2. Confirm that the tree is balanced by calling `#balanced?`
#3. Print out all elements in level, pre, post, and in order
#4. try to unbalance the tree by adding several numbers > 100
#5. Confirm that the tree is unbalanced by calling `#balanced?`
#6. Balance the tree by calling `#rebalance`
#7. Confirm that the tree is balanced by calling `#balanced?`
#8. Print out all elements in level, pre, post, and in order

require './lib/node'
require './lib/tree'
array = Array.new(15) { rand(1...100) }

#1
tree = Tree.new(array)
puts ' Tree root:'
tree.root.node_info

#2
puts '  ------------'
puts ' is tree balanced? '
puts tree.balanced?
puts ''

#3
tree.pretty_print
puts " Height: #{tree.height}"

puts ' Level-order:'
p tree.level_order

puts ' Preorder:'
p tree.preorder

puts ' Inorder:'
p tree.inorder

puts ' Postorder:'
p tree.postorder

#4
puts '  ------------'
puts ' add a few nodes to the tree: 600, 700, 800'
tree.insert(600)
tree.insert(700)
tree.insert(800)

#5
puts ' Is the tree still balanced? '
puts tree.balanced?

#6
tree.rebalance


#7
puts ' Is the tree balanced? '
puts tree.balanced?

#8 Print out all elements in level, pre, post, and in order
tree.pretty_print
puts " Height: #{tree.height}"

puts ' Level-order:'
p tree.level_order

puts ' Preorder:'
p tree.preorder

puts ' Inorder:'
p tree.inorder

puts ' Postorder:'
p tree.postorder



#######
