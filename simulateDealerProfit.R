# simulate 10,000 blackjack hands and calculate the profit to the casino.

# decide if you are using a single deck or 7 decks?
# according to https://en.wikipedia.org/wiki/Blackjack#Rules_of_play_at_casinos,
# house advantage increases the more decks are used
# therefore it is beneficial for a casino to use multiple decks.

simulateBlackjack <- function(num_hands, num_players){

# Rules
# player bets 1$, if player wins they get their money + 1$
# if player loses they lose 1$
# if a tie happens, player recovers money

# chance of player winning = 0.4222
# chance of dealer winning = 0.493
# chance of a tie          = 0.0848

winnings <- vector("integer", num_hands)
acc_winnings <- vector("integer", num_hands)

for (i in 1:length(winnings)){
  one_hand <- sample(c("D", "P", "T"), num_players, prob = c(0.493, 0.4222, 0.0848), replace = TRUE)
 
  # +1 for every time dealer wins
  # -1 for every time player wins
  winnings[i] <- length(one_hand[one_hand == "D"]) + length(one_hand[one_hand == "P"])*-1
  
  if(i != 1){
    acc_winnings[i] <- acc_winnings[i-1] + winnings[i]
  }else{
    acc_winnings[i] <- winnings[i]
  }
}
hist(winnings)
acc_winnings[num_hands]
}

simulateBlackjack(100, 6)
