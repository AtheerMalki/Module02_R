# --------------------------------------
# Theoretical slot machine simulation
# https://www.casinosmash.com/features/how-to-use-probability-to-win-at-slots-2814.htm
# --------------------------------------

simulate_Slot_Machines <- function(){
  
winnings <- vector("integer", 10000)
acc_winnings <- vector("integer", 10000)

# Slot Machine Odds:
# Number of winning combinations/Number of possible combinations = machine odds

# chance of player winning 96/216 = 0.4444
# chance of casino winning 120/216 = 0.5555

win_probability = c(0.4444, 0.5555)
num_player = 1

for (i in 1:length(winnings)){
  one_hand <- sample(c("P", "M"), num_player, prob = win_probability, replace = TRUE)
  
  # +1 for every time player loses
  # -1 for every time player wins
  winnings[i] <- length(one_hand[one_hand == "M"]) + length(one_hand[one_hand == "P"])*-1 
   
  if(i != 1){
    acc_winnings[i] <- acc_winnings[i-1] + winnings[i]
  }else{
    acc_winnings[i] <- winnings[i]
  }
}
acc_winnings[10000]
}