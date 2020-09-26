# ---------------------------------------------------------------
# --------------------- Playing Strategies ---------------------- 
# ---------------------------------------------------------------
# (https://en.wikipedia.org/wiki/Blackjack#Blackjack_strategy)
#----------------------------------------------------------------
# (1) Dealer Strategy (https://player.vimeo.com/video/391327048)
#----------------------------------------------------------------

analyzedHand <- hand_blackjack[hand_blackjack$player == "dealer",]
score <- score_hand(analyzedHand)

while(score<17){
  newcard <- dealacardBlackjack(playingBlackjack)
  newcard$player <- "dealer"
  hand_blackjack <- rbind(hand_blackjack, newcard)
  score <- score_hand(hand_blackjack[hand_blackjack$player == "dealer",])
}

# decide on value of ace
if(sum(hand_blackjack$value[hand_blackjack == "dealer"], na.rm = TRUE) > 10){
  hand_blackjack$value[hand_blackjack$player == "dealer" & hand_blackjack$face == "ace"] <- 1
}else{
  hand_blackjack$value[hand_blackjack$player == "dealer" & hand_blackjack$face == "ace"] <- 11
}

#----------------------------------------------------------------
# (2) Strategy for player (Hard Totals)
#----------------------------------------------------------------
# if player has 12 in hand and dealer's face-up card is 4, 5 or 6 
# player should stand, otherwise they should hit
#----------------------------------------------------------------

# get dealer's face-up card
dealer_faceup_card <- (hand_blackjack[hand_blackjack$player == "dealer",])[2,] 

# score player's hand
player_current_score <- score_hand(hand_blackjack[hand_blackjack$player == "player 1",]) 

best_move <- ""

if(player_current_score == 12){
  if(dealer_faceup_card$value %in% c(4, 5, 6)){
    best_move <- "Stand"
  }else{
    best_move <- "Hit" 
  }
}

best_move

#----------------------------------------------------------------
# (3) Strategy for player (Soft Totals)
#----------------------------------------------------------------
# if player has the pair (A,7)
# and the dealer's face-up card is 2-6 > player should double (if not allowed then stand).
# Otherwise, if the dealer's face-up card is 7 or 8 > player should stand. 
# Otherwise, if the dealer's face-up card is 9, 10 or A > player should hit.
#----------------------------------------------------------------

# get dealer's face-up card
dealer_faceup_card <- (hand_blackjack[hand_blackjack$player == "dealer",])[2,] 

# score player's hand
player_current_hand <- (hand_blackjack[hand_blackjack$player == "player 2",])

pl_card1 <- player_current_hand[1,]
pl_card2 <- player_current_hand[2,]

best_move <- ""

if ((pl_card1$face=="ace" & pl_card2$face=="seven") || (pl_card1$face=="seven" & pl_card2$face=="ace")){
  if (dealer_faceup_card$value %in% c(2,3,4,5,6)){
    best_move <- "Double (if not allowed then Stand)"
  } else if (dealer_faceup_card$value %in% c(7,8)) {
    best_move <- "Stand"
  } else {
    best_move <- "Hit"
  }
}

best_move