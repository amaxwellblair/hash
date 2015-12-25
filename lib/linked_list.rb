class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(key, value)
    if head.nil?
      @head = create_node(key, value)
    else
      tail.link = create_node(key, value)
    end
  end

  def tail(node = head)
    return node if node.link.nil?
    tail(node.link)
  end

  def find(key)
    find_upstream_node(key).link.value
  end

  def delete(key, node = head)
    upstream_node = find_upstream_node(key)
    deleted_node = upstream_node.link
    if deleted_node.link.nil?
      upstream_node.link = nil
    else
      upstream_node.link = deleted_node.link
    end
  end

  def find_upstream_node(key, node = head)
    return node if node.link.key == key
    find_upstream_node(key, node.link)
  end

  def create_node(key, value, link = nil)
    Struct::Node.new(key, value, link)
  end

  Struct.new("Node", :key, :value, :link)

end
