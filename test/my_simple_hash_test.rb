$LOAD_PATH.unshift("./lib/")
require 'simplecov'
SimpleCov.start
require 'minitest'
require 'pry'
require 'my_simple_hash'

class MySimpleHashTest < Minitest::Test
  attr_reader :hash

  def setup
    @hash = MySimpleHash.new
  end

  def test_class
    assert_equal MySimpleHash, hash.class
  end

  def test_initialize_with_arguments
    hash = MySimpleHash.new("k", 9)
    assert_equal 9, hash.retrieve("k")
  end

  def test_retreive_not_in_hash
    hash = MySimpleHash.new("k", 9)
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
