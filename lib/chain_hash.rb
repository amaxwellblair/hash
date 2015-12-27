require 'pry'
require 'digest'
require 'linked_list'

class ChainHash
  attr_reader :internal_array

  def initialize(key = nil, value = nil)
    @internal_array = Array.new(10)
    insert_lists
    insert(key, value)
  end

  def insert_lists
    internal_array.length.times do |index|
      internal_array[index] = create_list
    end
  end

  def create_list
    LinkedList.new
  end

  def keys
    internal_array.flat_map do |list|
      list
    end
  end

  def insert(key, value)
    if key_in_hash?(key)
      internal_array[hash_index(key)].delete(key)
      internal_array[hash_index(key)].append(key,value)
    else
      internal_array[hash_index(key)].append(key,value)
    end
  end

  def key_in_hash?(key)
    !internal_array[hash_index(key)].find(key).nil?
  end

  def hash_index(key)
    Digest::SHA1.hexdigest(key).to_i(16) % internal_array.length
  end

  def retrieve(key)
    internal_array[hash_index(key)].find(key)
  end

end
