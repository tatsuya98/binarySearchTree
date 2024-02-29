require 'byebug'

class Tree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def build_tree(array, start, last)
    mid = (start + last) / 2
    return nil if start > last

    node = Node.new(array[mid])
    node.left = build_tree(array, start, mid - 1)
    node.right = build_tree(array, mid + 1, last)
    node
  end

  def insert(value, node_direction)
    node = node_direction
    return Node.new(value) if node.nil?

    node.left = insert(value, node.left) if value < node.data

    node.right = insert(value, node.right) if value > node.data

    node
  end

  def delete(root = @root, value)
    return nil if root.data.nil?

    if value < root.data
      root.left = delete(root.left, value)
      return root
    elsif value > root.data
      root.right = delete(root.right, value)
      return root
    end
    if root.left.nil?
      temp = root.right
      return temp
    elsif root.right.nil?
      temp = root.left
      return temp
    elsif !root.right.nil? && !root.left.nil?
      delete_root(root)
    end
  end

  def delete_root(node)
    current_node = node.right
    prev_node = nil
    while !current_node.nil?
      prev_node = current_node
      current_node = current_node.left
    end
    node.data = prev_node.data
    node.right = prev_node.right
    node
  end
end

class Node
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end
