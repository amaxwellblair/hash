$LOAD_PATH.unshift("./lib/")
require 'simplecov'
SimpleCov.start
require 'minitest'
require 'pry'

class MyHashTest < Minitest::Test
  attr_reader :hash

  def setup
    @hash = MyHash.new
  end

  def test_class
    skip
    assert_equal MyHash, hash.class
  end

  def test_initialize
    skip
    assert_equal nil, hash.output
  end

  def test_insert_one_unit
    skip
    hash.insert("h", 9)
    assert_equal 9, hash.retrieve("h")
  end

  def test_insert_two_unit
    skip
    hash.insert("h", 9)
    hash.insert("k", 10)
    assert_equal 9, hash.retrieve("h")
    assert_equal 10, hash.retrieve("k")
  end

  def test_overwrite
    skip
    hash.insert("h", 9)
    hash.insert("h", 10)
    assert_equal 10, hash.retrieve("h")
  end

end
