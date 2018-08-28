class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {[]}
    place_stones
  end

  def place_stones
    @cups.each_index do |idx|
      next if idx == 6 || idx == 13
      @cups[idx] += [:stone, :stone, :stone, :stone]
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos >= 0 && start_pos <= 13
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    store = Array.new(@cups[start_pos].length, :stone)
    @cups[start_pos] = []

    until store.empty?
      if start_pos == 12
        start_pos = 0
      else
        start_pos += 1
      end
      @cups[start_pos] << store.pop

    end

    render
    next_turn(start_pos)
  end

  def next_turn(ending_cup_idx)
      if ending_cup_idx == 6 || ending_cup_idx == 13
        :prompt
      elsif @cups[ending_cup_idx].count == 0
        :switch
      else
        ending_cup_idx
      end
    end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
