require_relative 'node'

class Tree
  attr_reader :root, :height, :depth
  attr_accessor

  def initialize(array)
    @root = nil
    @array = array.sort.uniq
    build_tree(@array)
    balanced?
    @height = height
    puts ' New Tree Created :)'
    end

  ########
  def build_tree(array)
    return nil if array.empty?
    root = Node.new(array[array.size / 2])
    root.left_child = build_tree(array[0...array.size / 2])
    root.right_child = build_tree(array[(array.size / 2 + 1)..-1])
    @root = root
  end

  def height(node = @root, val = 0 )
    @val = val
    unless node.nil?
      @val += 1
      if node.left_child.nil?
        height(node.right_child, @val)
      else
        height(node.left_child, @val)
      end
    end
    return @val
  end

  ########
  # will find node if @data is a number
  def find(value, node = @root)
    if node.nil?
      puts "#{value} does not exist"
    elsif node.data == value
      return node
    elsif node.to_i > value
      find(value, node.left_child)
    elsif node.to_i < value
      find(value, node.right_child)
    end
  end

  ########
  def balanced?(node = @root)
    return true if node.nil?

    left_height = height(node.left_child)
    right_height = height(node.right_child)

    return true if (left_height - right_height).abs <= 1 && balanced?(node.left_child) && balanced?(node.right_child)

    false
  end

  def rebalance
    if balanced? == false
      array = preorder.sort.uniq
      build_tree(array)
      rebalance
    else
      balanced?
    end
  end

  ########
  def insert(data, node = @root)
    if node.left_child.nil?
      node.left_child = Node.new(data)
    else
      insert(data, node.left_child)
    end
  end

  def delete(data)
    node = find(data)


  end

  ########
  def level_order(array = Array.new, node = @root)
    array.push(node.data) unless node.nil? || node == @root
    left = level_order(array, node.left_child) unless node.left_child.nil?
    right = level_order(array, node.right_child) unless node.right_child.nil?

    return array
  end



  def preorder(array = Array.new, node = @root)
    array.push(node.data) unless node.nil?

    preorder(array, node.left_child) unless node.left_child.nil?
    preorder(array, node.right_child) unless node.right_child.nil?
    return array

  end

  def inorder(array = Array.new, node = @root)
    array.push(node.data) unless node.nil? || node == @root
    array.push(inorder(array, node.right_child)) unless node.left_child.nil?
    array.push(@root.data)
    array.push(inorder(array, node.left_child)) unless node.left_child.nil?


  end

  # array.include?(@root.data) ? nil : array.push(@root.data)

  def postorder(array = Array.new, node = @root)

  end

  ########
  # pretty_print from another student. pretty isnt it?
  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right_child, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right_child
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left_child, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left_child
  end

end
