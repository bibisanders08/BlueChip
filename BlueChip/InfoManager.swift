//
//  InfoManager.swift
//  BlueChip
//
//  Created by admin on 5/11/24.
//



import Foundation


class InfoManager {
    
    static let shared = InfoManager()
    
    private init(){}
    
    let highCard = """
High card - if none of the players collects a combination from those listed above, then the winner is determined by the highest card. For example, A,J,8,6,2 will be stronger than Q,J,8,6,2.
 
If opponents have the highest cards of the same rank, then they look at the seniority of other cards.

"""
    
    let onePair =  """
Pair - this combination consists of two cards of the same rank. If several players make a pair, then the one with the higher rank of the pair wins. If the rank is the same, then the winner is determined by the seniority of other cards (first the third, then the fourth, then the fifth). For example, the pair K,K,A,9,8 would win against the pair from our example, and the pair Q,Q,10,6,2 would lose to ours.
"""
     
    let twoPair = """
Two pair is a combination in which two cards of the same rank are collected with two more cards of a different rank. If several players make two pairs, the higher pair determines the winner. For example, J,J,9,9,5 will be stronger than 10,10,9,9,5. If the senior pairs are of the same strength, then they look at the strength of the second pair. If they are the same, then the winner is determined by the strength of the fifth card.
"""
    
    let threeOfAKind = """
Three of a kind (set) - a combination consists of three cards of the same rank. The remaining two cards can be anything. The winner in identical combinations is determined by the seniority of three cards. For example, three sevens beat three fives. If players have collected combinations with the same three cards, then they look at who has the stronger card from the two remaining cards. If these cards are also equal, then the seniority of the last card determines the winner.
"""
    
    let straight = """
Straight - this combination consists of 5 consecutive cards of any suit. The name of the street indicates the highest card. For example, in the image there is a straight to ten. It is the highest card that determines the winner if several players collect a straight. If the highest cards are of the same rank, then they look at the seniority of the second card and so on.
 
We remind you that an ace can be either the strongest or weakest card. For example, with an Ace you can make the following combinations: A, K, Q, J, 10 or 5, 4, 3, 2, A.
"""
    
    let flush = """
Flush - in this combination all cards are of the same suit. If several players collect this combination, then the winner is determined by the highest card. If the highest cards are of the same rank, then they look at the second strongest card and so on.
"""
    
    let fullHouse = """
Full House is a beautiful combination consisting of five cards: three cards of the same rank and an additional pair of cards. The strength of a hand is determined by three cards of the same rank. For example, the full house pictured above will beat K,K,K,Q,Q. If players collect combinations with the same three cards, then the winner is determined by the seniority of the pair.
"""
    
    let fourOfAKind = """
Four of a kind is a combination that consists of four cards of the same rank. If several players get four of a kind, the one with the higher rank cards wins. For example, quad of kings (K,K,K,K,x) will beat the combination shown above.
"""
    
    let straightFlush = """
Straight flush is the second strongest combination. Consists of 5 consecutive cards of the same suit. The name indicates the highest card in the combination. For example, the image above shows a straight flush up to eight.
 
If a straight flush is collected by several players at the same time, then the player with the highest card in the combination wins. For example, a straight flush to a queen (Q,J,10,9,8) will beat our straight flush in the image.

  Note! The Ace can be used in combination as either the strongest or the lowest card. For example, A,K,Q,J,10 or 5,4,3,2,A.
"""
    
    let royalFlush = """
Royal Flush (or Royal Flush) is the strongest and most desirable combination in poker. It consists of cards of the same suit from ten to ace. The suit does not matter, but all cards must be of the same suit. This is a very rare combination and players often wait several years to collect it. But with opponents it happens much more often.
"""
    
    
    let r1 = "Deck of cards for playing Texas Holdem"
    let r1Info = """
Texas Hold'em is played with a standard deck, which consists of 52 cards ranging from deuce to ace. In poker, the lowest card at face value is a deuce, and the highest card is an ace.
However, it is worth remembering right away that the ace can also play the role of the lowest card in such a combination as the lowest straight - A-2-3-4-5. But this is the only exception. In all other cases, the ace is the strongest card in the deck.
"""
    
    let r2 = "Types of poker tables"
    let r2Info = """
Texas Hold'em can be played by two to ten people. In this case, depending on the number of maximum number of participants, gaming tables can be:
- Long (9-10 players - 9-max or 10-max);
- Short (6 players - 6-max);
- Ultra-short (4 players - 4-max);
- Heads-up table (2 players - HU).
Sometimes there are other tables, in particular, 3-max. For example, special mini-tournaments with a Spin&Go jackpot have just this format, because... designed for three players.
"""
    
    let r3 = "Poker dealer"
    let r3Info = """
The dealer is, in fact, the same croupier in the casino. This is a person who distributes cards to players, monitors compliance with all rules and the progress of distribution, and also counts chips, etc. Of course, in online poker there are no dealers (unless you play video poker with a live dealer) - the program performs all the functions for him.
But in a live game, a dealer is simply necessary. Without it, playing poker is impossible. If you decide to play with friends, you need to follow the rules. Thus, the role of the dealer passes from one player to another (clockwise) in each new hand. The dealer's position is indicated by a special button called the button. This is one of the most profitable positions at the gaming table, because... The person sitting on the button makes his last move.
"""
    
    let r4 = "Blinds in Texas Hold'em"
    let r4Info = """
A prerequisite for playing classic poker is mandatory bets, the so-called blinds. The blinds in each hand are made by two participants who sit at the table to the left of the dealer, even before receiving pocket cards in their hands. There are small and big blinds. The small blind is the position immediately behind the dealer, and the big blind is located to the left of the small blind.
The big blind is always 2 times the small blind. So, if you are playing at NL2, the small blind will be $0.01 and the big blind will be $0.02.
It is worth noting that while in a cash game the blinds are always the same, in tournaments their size constantly increases over time.
"""
    
    let r5 = "Poker combinations"
    let r5Info = """
There are a total of 10 combinations in Texas Hold'em. You can find out more in the "Combinations" section.
"""
    
    let r6 = "Texas Hold'em Betting Rounds"
    let r6Info = """
Have you identified the dealer and already made the required bets (blinds)? Great, then you can start the first distribution. The dealer distributes two pocket cards to all participants in the game. Using these two cards, as well as the five community board cards that will appear later in the distribution process, players form combinations.
In just one hand, there are 4 rounds or “streets” of betting in Texas Hold’em. During these streets, a common bank is formed, which will eventually go to one or more poker players.
"""
    
    let r7 = "Preflop"
    let r7Info = """
This is the very first round of betting in poker, which starts immediately after the dealer has dealt pocket cards to all players at the table. Poker players look at their cards, assess their strength and prospects, and make a decision. If the hand is weak, then the player will most likely fold it so as not to overpay extra money (chips). Those participants who have deep pockets will continue the game by placing bets. The first player to speak is the one immediately to the left of the big blind - this position is called UTG (under the gun). This poker player, like all others, has several options for entering the game.
Player options in poker:
A bet is essentially the first bet in a hand. By betting, the player raises by a certain number of chips; A raise is also an increase in the bet, but unlike a bet, a raise is an increase in the previous bet. There are many variations of a raise, but usually the raise is the first raise, known as a 2-bet; Reraise - raising a bet that has already been raised; Call - equalization of the previous bet; Fold - discarding your pocket cards; refusal to further participate in the distribution; Check - skip a move. A check can only be made if there have been no previous promotions; All-in (all-in, all-in) - raising the bet on all your chips.
Now that we understand what actions a player can take during the course of a hand, let's get back to the betting rounds.
"""
    
    let r8 = "Flop"
    let r8Info = """
The second round or street of betting in poker is the flop. The flop is the stage when the dealer deals the first three community cards, which players can use to make combinations. On the flop, poker players receive more information. They better understand the strength and prospects of their hand or can already make some combinations. In theory, you can “catch” absolutely any poker combination on the flop, from a pair to a royal flush.
On the flop, the player to the left of the dealer makes his first move.
"""
    
    let r9 = "Turn"
    let r9Info = """
When all bets on the flop have been made, the dealer deals the fourth community card, called the turn. Participants remaining in the hand by this time begin a new round of bidding again.
"""
    
    let r10 = "River"
    let r10Info = """
The final street of betting in poker begins when the dealer draws the last, fifth community card from the deck. Here the players already have the maximum amount of information. They already know the value of their pocket cards and should have a rough idea of the potential strength of their opponents' pockets. The river is the last time you can increase the pot.
"""
    
    let r11 = "Showdown"
    let r11Info = """
This is not essentially a betting round, but it is the showdown that ends the hand if two or more players reach the winning end. Showdown is a showdown to determine who will win the hand and take home the pot that was formed through four rounds of bidding. Everything is simple here - whoever has the better combination wins. Poker players start opening with the person who sits to the left of the dealer.
"""
    
    let t1 = "Play fewer hands"
    let t1Info = """
One of the most common mistakes amateur players make is not being selective enough with their starting hands. Many players have the wrong mindset in this regard, thinking "Any hand can win." While this is true, some hands will win more often and make you more money, while others will just burn you up. Therefore, be selective about the hands you plan to play with.

Good starting hand selection is the foundation of every winning poker player. Remember this!
"""
    
    let t2 = "Don't bluff too often"
    let t2Info = """
Another common misconception about poker is that you have to bluff to win. You may have seen incredible, big bluffs from pros on the WSOP on TV, but those episodes are just highlight reels of the tournament and therefore give a false impression of the actual frequency of top players' bluffs.

Bluffs in poker aren't as necessary as you might think.
If you're new to online poker, it's much better to learn how to play your value hands correctly rather than trying to bluff your opponents. It’s good, of course, to occasionally try to bluff at the right moments, but real mastery of bluffing only comes from experience and knowledge.
"""
    let t3 = "Think about your opponents' cards"
    let t3Info = """
In poker, it is extremely important to think about the strength of your opponents' hands rather than the strength of your own hand. It's nice to have a strong hand, but if you think your opponent has a stronger hand, then you need to be prepared to fold. For example, a straight is a perfectly strong hand, but if there are four suited cards on the board and your opponent shoves all-in, do you really think you still have the best hand?
"""
    let t4 = "Play against players worse than you"
    let t4Info = """
This may seem pretty obvious, but you'd be surprised how many players ignore this simple principle. If you are better than the people you are playing against, then it makes sense that you will win over the long haul. If, for example, you are the 10th best player in the world, then it will not be profitable for you to sit at the same table with the rest of the top 9 players in the world.

Choose your gaming tables and limits as carefully as you choose the cards you play. Good table selection is the key to success.
"""
    let t5 = "Pay attention to the position"
    let t5Info = """
Table position is a very important factor in poker, especially in Texas Hold'em. The best position will be when you are the last one to make a decision, for example when you are sitting on the button. This means that you will have the advantage of gaining additional information about the strength of your opponents' hands by acting last. Having good position in a hand can easily turn a losing player into a winning one.

Position plays a bigger role in Texas Hold'em than you might think. Often it can be even more important than the cards themselves.
"""
    let t6 = "Play carefully"
    let t6Info = """
The best way to get a hint from your opponents is to constantly watch them as they play each pot. Even if you are not involved in the hand, you still need to be as focused on the game as possible to understand how your opponents are playing.

You must notice how your opponent plays his weak hands and how he plays his strong hands. The more information you can extract from your opponents, the more opportunities you will have to outplay them.
"""
    let t7 = "Don't jump to high limits right away"
    let t7Info = """
There are two reasons why you shouldn't play for too much money as a beginner. Firstly, high stakes players will perform better than low stakes players. You will be less likely to outplay them, and the amount of money you will lose during the learning process will be greater.

Secondly, you should only play at limits that you can afford in terms of your bankroll. You should not play at limits where losing a few stacks would be catastrophic for you.
"""
    let t8 = "Don't overplay drawing hands"
    let t8Info = """
Often you will find yourself in situations where you have hands that are one card short of making a flush or straight. The general rule here is that if your opponent is betting big, then more often than not trying to hit your draw will not be profitable. However, if the opponent bets little, then it would be quite reasonable to call in the hope of getting there. If your opponents' bets are too big to call with draws, then you shouldn't do it.
"""
    let t9 = "Suited cards aren't that great"
    let t9Info = """
Another common mistake that beginners (and some intermediate players) make is overvaluing suited hands. Flushes don't close as often as you might think.

And if you limp with two small suited cards, you are much more likely to lose all your money to a higher flush. Having your cards suited only improves your hand by 2% compared to an unsuited hand.

This marginal advantage gives you no reason to call preflop raises, so learn to fold small suited hands. This way you will save some money over the course.
"""
    let t10 = "Know the rules"
    let t10Info = """
Although this is obvious, nothing can replace knowing the rules of the game. You don't want to end up in a situation where you call someone's shove, thinking your straight beats a flush, and lose your stack. It is impossible to become a winning player without knowing the fundamental rules of the game.
"""
    

    
}

