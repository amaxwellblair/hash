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
    found = find_node(key)
    return nil if found.nil?
    found.value
  end

  def delete(key, node = head)
    upstream_node = find_upstream_node(key)
    deleted_node = upstream_node.link
    if upstream_node == head && upstream_node.key == key
      @head = deleted_node
    else
      upstream_node.link = deleted_node.link
    end
  end

  def all_keys(node = head, key_array = [])
    if node.nil?
      return key_array
    else
      key_array << node.key
      all_keys(node.link, key_array)
    end
  end

  def all_values(node = head, value_array = [])
    if node.nil?
      return value_array
    else
      value_array << node.value
      all_values(node.link, value_array)
    end
  end

  def find_node(key, node = head)
    # binding.pry
    if node.nil?
      nil
    elsif node.key == key
      return node
    else
      find_node(key, node.link)
    end
  end

  def find_upstream_node(key, node = head)
    if node.link.nil? && node.key != key
      nil
    elsif node.key == key || node.link.key == key
      return node
    else
      find_upstream_node(key, node.link)
    end
  end

  def create_node(key, value, link = nil)
    Struct::Node.new(key, value, link)
  end

  Struct.new("Node", :key, :value, :link)

end
