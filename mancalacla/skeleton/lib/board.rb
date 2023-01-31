class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {[]}
    (0..5).each {|idx| 4.times {@cups[idx] << :stone }} 
    (7..12).each {|idx| 4.times {@cups[idx] << :stone }}
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    if start_pos < 0 || start_pos > 13
    raise ArgumentError.new("Invalid starting cup")
    end
    if cups[start_pos].empty?
      raise ArgumentError.new("Starting cup is empty")
    end
    return true
  end

  def make_move(start_pos, current_player_name)
    if valid_move?(start_pos)
      held_stones = []
      while !@cup[start_pos].empty?
        held_stones << @cup[start_pos].shift
      end
      
    

  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
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
