
# 1.2
#
class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2

  valid=['R','P','S']
  raise NoSuchStrategyError unless valid.include? game[0][1].upcase
  raise NoSuchStrategyError unless valid.include? game[1][1].upcase

  # if the same strategy then player 1 wins
  if game[0][1].upcase==game[1][1].upcase
    return game[0]
  end

  # Rock > Scissors,   Scissors > Paper,   Paper > Rock  
  wins=['RS','SP','PR']
  current=game[0][1].upcase+game[1][1].upcase
  if wins.include? current 
    return game[0]
  else
    return game[1]
  end

end


def rps_tournament_winner (tourney)

  #recurse, so put the stop in first
  if tourney[0][0].kind_of? String
    rps_game_winner tourney
  else # pair off the two sides of the tournament and recurse
    left=rps_tournament_winner tourney[0]
    right=rps_tournament_winner tourney[1]
    rps_game_winner [left, right]
  end

end


# rps_game_winner [["Armando", "P"], ["Dave", "S"]]           => Dave S
# rps_game_winner [["Richard", "R"], ["Michael", "S"]]        => Richard R
# rps_game_winner [["Allen", "S"], ["Omer", "P"]]             => Allen S
# rps_game_winner [["David E.", "R"], ["Richard X.", "P"]]    => Richard X. P

# rps_tournament_winner [[[["Armando","P"],["Dave","S"]],[["Richard","R"], ["Michael","S"]],],[[["Allen","S"],["Omer","P"]],[["David E.","R"],["Richard X.","P"]]]]


