$LOAD_PATH.unshift("./lib/")
require 'simplecov'
SimpleCov.start
require 'minitest'
require 'pry'
require 'linked_list'

class LinkedListTest < Minitest::Test
  attr_reader :list

  def setup
    @list = LinkedList.new
  end

  def test_class
    assert_equal LinkedList, list.class
  end

  def test_struct_node
    list.append(:it, "value")
    assert_equal LinkedList::Struct::Node, list.head.class
  end

  def test_head
    list.append(:it, "value")
    assert_equal "value", list.head.value
  end

  def test_tail
    list.append(:it, "value")
    assert_equal "value", list.tail.value
  end

  def test_simple_append
    list.append(:it, "value")
    list.append(:imp, "warlock")
    assert_equal "warlock", list.tail.value
    assert_equal "value", list.head.value
  end

  def test_find_node
    list.append(:it, "value")
    list.append(:imp, "warlock")
    list.append(:taste, "bacon")
    assert_equal "warlock", list.find(:imp)
  end

  def test_delete
    list.append(:it, "value")
    list.append(:imp, "warlock")
    list.append(:taste, "bacon")
    list.delete(:taste)
    assert_equal "warlock", list.tail.value
  end

end
