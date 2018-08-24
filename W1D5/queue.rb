class Queue
  attr_reader :line
  def initialize(line=[])
    @line = line
  end

  def enqueue(el)
    @line.unshift(el)
  end

  def dequeue
    @line.pop
  end

  def peek
    @line[-1]
  end
end
