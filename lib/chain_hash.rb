require 'pry'
require 'digest'

class ChainHash
  attr_reader :internal_array

  def initialize(key = nil, value = nil, list)
    @internal_array = Array.new(3, list)
    insert(key, value)
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
    internal_array[hash_index(key)].find(key) == true
  end

  def hash_index(key)
    Digest::SHA1.hexdigest(key).to_i(16) % internal_array.length
  end

  def retrieve(key)
    internal_array[hash_index(key)].find(key)
  end

end
