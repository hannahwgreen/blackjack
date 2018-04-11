require_relative "card"
require_relative "deck"
require_relative "hand"
require 'pry'

puts "Welcome to Blackjack!"
puts "\n"
player = Hand.new
computer = Hand.new

deck = Deck.new
2.times do |i|
  i = player.hand_array.push(deck.draw!) && computer.hand_array.push(deck.draw!)
end


player.hand_array.each do |card|
  puts "Player was dealt #{card.rank}#{card.suit}"
end

player_score = player.check_aces

puts "Player score: #{player_score}"

puts "\n"

input = "h"
while player_score < 21 && input != "s"
  print "Hit or stand (H/S): "
  input = gets.chomp.downcase
  puts "\n"
  if input == "s"
    puts "Player score: #{player_score}\n\n"
  elsif input == "h"
    player.hand_array.push(deck.draw!)
    puts "Player was dealt #{player.hand_array.last.rank}#{player.hand_array.last.suit}"
    player_score = player.check_aces
    puts "Player score: #{player_score}\n\n"
  else
    puts "Invalid input."
  end
end

if player_score > 21
  puts "\nBust!  You lose..."
end

if player_score <= 21
  computer.hand_array.each do |card|
    puts "Dealer was dealt #{card.rank}#{card.suit}"
  end

  dealer_score = computer.check_aces
  puts "Dealer score: #{dealer_score}\n\n"

  while dealer_score <= 17
    computer.hand_array.push(deck.draw!)
    puts "Dealer was dealt #{computer.hand_array.last.rank}#{computer.hand_array.last.suit}"
    dealer_score = computer.check_aces
    puts "Dealer score: #{dealer_score}\n\n"
  end
end

if player_score == 21
  puts "Blackjack you win!"
  elsif dealer_score != nil && dealer_score > 21
    puts "Dealer busts!  You win!"
    elsif dealer_score != nil && 17 < dealer_score
      puts "Dealer Stands\n\n"
      if dealer_score != nil && dealer_score > player_score
        puts "Dealer wins!"
      elsif dealer_score != nil && player_score > dealer_score
        puts "You win!"
      else
        puts "It's a tie!"
      end
    end
