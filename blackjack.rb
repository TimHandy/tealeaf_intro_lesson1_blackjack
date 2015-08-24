# blackjack.rb

def calculate_total(cards) # where cards is and array of arrays
  card_values = cards.map { |e| e[0] }  # create an array of just the card values

  total = 0

  card_values.each do |value|
    if value == 'A' # for Ace
      total += 11
    elsif value.to_i == 0  # e.g. if it attempts to do a .to_i on a J/Q/K
      total += 10  # for face card
    else 
      total += value.to_i  # add up number cards
    end
  end

    # correct for aces
    card_values.select{|e| e == "A"}.count.times do
      if total > 21
      total -= 10
      end      
    end
   
  total
end


# initialize shoe and randomize
suits = [ 'H', 'S', 'C', 'D' ]
cards = [ '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A' ]

shoe = cards.product(suits).shuffle!

# initialize player array
player_cards = []

# initialize dealer array
dealer_cards = []

# deal cards
# dealer deals card to player, player sees card

player_cards << shoe.pop
dealer_cards << shoe.pop
player_cards << shoe.pop
dealer_cards << shoe.pop

dealer_total = calculate_total(dealer_cards)
player_total = calculate_total(player_cards)

# Show cards
puts "Dealer cards: #{dealer_cards[0]} and #{dealer_cards[1]}. Dealer total is #{dealer_total}"
puts "Your cards: #{player_cards[0]} and #{player_cards[1]}. Your total is #{player_total}"

# player turn
if player_total == 21
  puts "congrats, you hit Blackjack, you win!"
  exit  # exit condition
end

# player has option of Hit or Stay 
while player_total < 21
  print "Hit or Stay? (h/s): "
  hit_or_stay = gets.chomp
  
  if !['h', 's'].include?(hit_or_stay)
    puts 'error: you must enter h or s'
    next  # goes to next iteration
  end
  if hit_or_stay == "s"
    puts "you chose to stay"
    break # breaks out of the loop
  end

  # Hit
  new_card = shoe.pop
  puts "Dealing card to player: #{new_card}"
  player_cards << new_card
  player_total = calculate_total(player_cards)
  puts "your total is #{player_total}"

  if player_total == 21
    puts "Congratulations, you hit Blackjack, you win!"
    exit
  elsif player_total > 21
    puts "Sorry, you busted!"
    exit
  end
end

# Dealer turn

if dealer_total == 21
  puts "Sorry, dealer hit Blackjack, you lose!"
  exit
end

while dealer_total < 17  # if dealer is less than 17 they have to hit
  # hit
  new_card = shoe.pop
  puts "Dealing new card for dealer: "
  dealer_cards << new_card
  dealer_total = calculate_total(dealer_cards)
  puts "Dealer total is now: #{dealer_total}"

  if dealer_total == 21
    puts "sorry, dealer hit Blackjack, you lose!"
    exit
  elsif dealer_total > 21
    puts "Congratulations, dealer busted, You win!"
    exit
  end
end

# compare hand

puts "Dealer's cards: "
dealer_cards.each do |card|
  puts "=> #{card}"
end

puts "your cards: "
player_cards.each do |card|
  puts "=> #{card}"
end

if dealer_total > player_total
  puts "Sorry, dealer won!"
elsif player_total > dealer_total
  puts "Congratulations, you won!"
else
  puts "It's a tie, bummer!"  
end

exit





# if hit_or_stay == 'h'
  # deal another card
  # add to total
  # if calculate_total > 21
  # bust
#elsif hit_or_stay == 's'
  # computer chooses
#else






# loop do 
#   # check if dealer has 21
#   if dealer_cards[0,0].to_i + dealer_cards[1,0].to_i == 21
#     puts "dealer has blackjack, dealer wins!"
#     break
#   end

  

  # if Hit, dealer deals card to player, player sees hand
  # if 21, player wins. If not 21, until 21 (win), or > dealer total but < 21, or > 21 (lose)


# end
  



