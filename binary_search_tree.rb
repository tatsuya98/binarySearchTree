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
end

class Node
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end
