require 'pry'
require_relative 'deck.rb'

class Hand
  attr_accessor :hand_array
  def initialize
    @hand_array = []
    @score = 0
  end

  def check_aces
    calculate_hand
    if @score > 21
      ace_count = 0
      @hand_array.each do |card|
        if card.ace?
          ace_count += 1
          @score -= 10
        end
      end
    else
      return @score
    end
    if @score <= 11 && ace_count >= 2
      @score += 10
    else
      return @score
    end
  end


  def calculate_hand
    @score = 0
    @hand_array.each do |card|
      if card.face_card?
        @score += 10
      elsif card.ace?
        @score += 11
      else
        @score += card.rank.to_i
      end
    end
    @score
    return @score
  end
end
