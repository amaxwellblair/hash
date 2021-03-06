$LOAD_PATH.unshift("./lib/")
require 'simplecov'
SimpleCov.start
require 'minitest'
require 'pry'
require 'chain_hash'

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

  def test_return_all_keys
    hash.insert("h", 9)
    hash.insert("k", 10)
    hash.insert("j", 11)
    hash.insert("l", 12)
    hash.keys.each do |k|
      assert_equal true, %w(m h k j l).any?{|key| k == key}
    end
  end

  def test_return_all_values
    hash.insert("h", 9)
    hash.insert("k", 10)
    hash.insert("j", 11)
    hash.insert("l", 12)
    hash.values.each do |v|
      assert_equal true, ["blair", 9, 10, 11, 12].any?{|values| v == values}
    end
  end

  def test_return_all_keys_and_values_as_pairs
    hash.insert("h", 9)
    hash.insert("k", 10)
    hash.insert("j", 11)
    hash.insert("l", 12)
    pairs = hash.keys.zip(hash.values)
    pairs.each do |p|
      assert_equal true, [["m", "blair"], ["h", 9], ["k", 10], ["j", 11], ["l", 12]].any?{|pair| p == pair}
    end
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

  def test_resized_array_length
    hash.insert("h", 9)
    hash.insert("k", 10)
    hash.insert("j", 11)
    hash.insert("l", 12)
    hash.resized_array(100)
    assert_equal 100, hash.internal_array.length
  end

  def test_resized_array_retrieve
    hash.insert("h", 9)
    hash.insert("k", 10)
    hash.insert("j", 11)
    hash.insert("l", 12)
    hash.resized_array(100)
    assert_equal 9, hash.retrieve("h")
  end

  # def test_resize_bool
  #   hash.insert("h", 9)
  #   hash.insert("k", 10)
  #   hash.insert("z", 25)
  #   hash.insert("x", -5)
  #   hash.insert("chicken", 100)
  #   hash.insert("poop", 55)
  #   hash.insert("gerald", 10)
  #   hash.insert("kimberly", 7)
  #   hash.insert("max", 999999)
  #   assert_equal true, hash.resize?
  # end

  def test_resize_bool_false
    hash.insert("h", 9)
    hash.insert("k",   10)
    hash.insert("z", 25)
    hash.insert("x", -5)
    assert_equal false, hash.resize?
  end

end
