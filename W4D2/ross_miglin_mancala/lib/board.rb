require "byebug"
require_relative 'player'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14){Array.new}
    self.place_stones
  end

  def place_stones
    self.cups.each.with_index do |cup, idx|
      if idx != 6 && idx != 13
        4.times{cup << :stone}
      end
    end
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    if start_pos < 0 || start_pos > 13
      raise 'Invalid starting cup'
    elsif self.cups[start_pos].length == 0
      raise 'Starting cup is empty'
    end

  end

  def make_move(start_pos, current_player_name)
    self.valid_move?(start_pos)
    stones_arr = []
    self.cups[start_pos].length.times{stones_arr << :stone}
    self.cups[start_pos].clear

    while !stones_arr.empty?
      start_pos += 1
      if start_pos > 13
        start_pos -= 14
      end
      if start_pos == 6 || start_pos == 13
        if current_player_name == @name1 && start_pos == 6
          self.cups[start_pos] << stones_arr.pop
        end  
        if current_player_name == @name2 && start_pos == 13
          self.cups[start_pos] << stones_arr.pop
        end
      else
        self.cups[start_pos] << stones_arr.pop 
      end
    end
    self.render
    puts start_pos
    self.next_turn(start_pos, current_player_name)
  end

  def next_turn(ending_cup_idx,current_player_name)
    if (current_player_name == @name1 && ending_cup_idx.between?(0,6)) ||
      (current_player_name == @name2 && ending_cup_idx.between?(7, 13))
      return :prompt
    end
    if self.cups[ending_cup_idx].length == 1
      return :switch
    end
    if !self.cups[ending_cup_idx].empty?
      return ending_cup_idx
    end

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
    (0...6).all?{|idx| self.cups[idx].empty?} || (7...13).all?{|idx| self.cups[idx].empty?}
  end

  def winner
    if self.cups[6] == self.cups[13]
      return :draw
    elsif self.cups[6].length > self.cups[13].length 
      return @name1
    else
      return @name2
    end
  end
end
