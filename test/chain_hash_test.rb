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
    @hash = ChainHash.new("m", "blair")
  end

  def test_class
    assert_equal ChainHash, hash.class
  end

  def test_intialize
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

  def test_insert_nine_units
    hash.insert("h", 9)
    hash.insert("k", 10)
    hash.insert("z", 25)
    hash.insert("x", -5)
    hash.insert("chicken", 100)
    hash.insert("poop", 55)
    hash.insert("gerald", 10)
    hash.insert("kimberly", 7)
    hash.insert("max", 999999)
    assert_equal 9, hash.retrieve("h")
    assert_equal 10, hash.retrieve("k")
  end

  def test_overwrite
    hash.insert("h", 9)
    hash.insert("h", 10)
    assert_equal 10, hash.retrieve("h")
  end

end
