class Map
  attr_accessor :data

  def initialize(data = [])
    @data = data
  end

  def set(key, value)
    flag = false
    @data.each do |pair|
      if pair.first == key
        pair[-1] = value
        flag = true
        break
      end
    end
    @data << [key, value] unless flag
  end

  def get(key)
    data.each do |pair|
      return pair.last if pair.first == key
    end
    nil
  end

  def delete(key)
    @data.reject! {|pair| pair.first == key}
  end

  def show
    @data
  end
end
