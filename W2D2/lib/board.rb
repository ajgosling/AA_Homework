require "byebug"
class Board
  attr_accessor :cups, :name1, :name2

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
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
    # empties cup
    stones = @cups[start_pos]
    @cups[start_pos] = []

    until stones.empty?
      start_pos += 1
      start_pos = 0 if start_pos > 13
      # places stones in the correct current player's cups
      if start_pos == 6
        @cups[6] << stones.pop if current_player_name == @name1
      elsif start_pos == 13
        @cups[13] << stones.pop if current_player_name == @name2
      else
        @cups[start_pos] << stones.pop
      end
    end

    render
    next_turn(start_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6
      :prompt
    elsif
      ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
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
    front_empty = @cups[0..5].all? { |cup| cup.empty? }
    back_empty = @cups[7..12].all? { |cup| cup.empty? }
    front_empty || back_empty
  end

  def winner
    player1_count = @cups[6].count
    player2_count = @cups[13].count


    case player1_count <=> player2_count
    when 1
      @name1
    when -1
      @name2
    else
      :draw
    end
  end
end
