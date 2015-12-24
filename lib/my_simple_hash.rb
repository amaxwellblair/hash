require 'digest'

class MySimpleHash
  attr_reader :internal_array

  def initialize(key = nil, value = nil)
    @internal_array = Array.new(3)
    insert(key, value)
  end

  def insert(key, value)
    if key != nil && value != nil
      index = Digest::SHA1.hexdigest(key).to_i % internal_array.length
      internal_array[index] = value
    end
  end

  def retrieve(key)
    index = Digest::SHA1.hexdigest(key).to_i % internal_array.length
    internal_array[index]
  end

end
