#having imported deck.csv and created 'blackjack' & 'hearts' dataframes in RStudio's global enviroment.
#############

#Write custom functions for shuffling the deck
shuffle<-function(deck){
  return(deck[sample(1:52,52),])
}

#Write a custom function for dealing cards to 2 players in hearts (13 cards each)
dealHearts <- function(){
  hearts <- shuffle(hearts)
  
  player1 <- c()
  player2 <- c()
  
  for(i in 1:13){
    player1 <- rbind(player1, head(hearts, 1))
    hearts <- tail(hearts, -1)
    
    player2 <- rbind(player2, head(hearts, 1))
    hearts <- tail(hearts, -1)
  }
    print(player1)
    print(player2)
  }

#write a custom function for dealing cards to 2 players and a dealer in blackjack (2 cards each)
dealBlackjack <- function(){
  blackjack <- shuffle(blackjack)
  
  player1 <- c()
  player2 <- c()
  dealer <- c()
  
  for(i in 1:2){
    player1 <- rbind(player1, head(blackjack, 1))
    blackjack <- tail(blackjack, -1)
    
    player2 <- rbind(player2, head(blackjack, 1))
    blackjack <- tail(blackjack, -1)
    
    dealer <- rbind(dealer, head(blackjack, 1))
    blackjack <- tail(blackjack, -1)
  }
  
    print(player1)
    print(player2)
    print(dealer)
  }