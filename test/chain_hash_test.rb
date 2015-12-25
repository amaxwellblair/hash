$LOAD_PATH.unshift("./lib/")
require 'simplecov'
SimpleCov.start
require 'minitest'
require 'pry'
require 'chain_hash'
require 'linked_list'

class ChainHashTest < Minitest::Test

  attr_reader :hash

  def setup
    list = LinkedList.new
    @hash = ChainHash.new("m", "blair", list)
  end

  def test_class
    assert_equal ChainHash, hash.class
  end

  def test_initialize_with_arguments
    assert_equal "blair", hash.retrieve("m")
  end

  def test_retreive_not_in_hash
    assert_equal nil, hash.retrieve("hello")
  end

  def test_insert_one_unit
    hash.insert("h", 9)
    assert_equal 9, hash.retrieve("h")
  end

  def test_insert_two_unit
    hash.insert("h", 9)
    hash.insert("k", 10)
    assert_equal 9, hash.retrieve("h")
    assert_equal 10, hash.retrieve("k")
  end

  def test_overwrite
    hash.insert("h", 9)
    hash.insert("h", 10)
    assert_equal 10, hash.retrieve("h")
  end

end
