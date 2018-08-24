class Stack
  attr_reader :line
  def initialize
    @line = []
  end

  def push(el)
    @line << el
  end

  def pop
    @line.pop
  end

  def peek
    @line[-1]
  end
end