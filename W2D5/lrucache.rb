class LRUCache
  def initialize(max_length)

    @cache = []
    @max_length = max_length

  end

  def count
    @cache.size
  end

  def add(el)
    if @cache.include?(el)
      @cache.delete(el)
    elsif @cache.count == @max_length
      @cache.shift
    end

    @cache << el

  end

  def show
    p @cache
    nil
  end
end
