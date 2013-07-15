class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

# The rules are: R beats S; S beats P; and P beats R
def rps_result(m1, m2)
  if m1[1].upcase == m2[1].upcase
  	return m1
  elsif m1[1].upcase == 'R' && m2[1].upcase == 'S'
  	return m1
  elsif m1[1].upcase == 'S' && m2[1].upcase == 'P'
  	return m1
  elsif m1[1].upcase == 'P' && m2[1].upcase == 'R'
    return m1
  else
	return m2
  end

end

# game = [ ["Armando", "P"], ["Dave", "S"] ]
def rps_game_winner(game)
  # If the number of players is not equal to 2, 
  # raise WrongNumberOfPlayersError.
  raise WrongNumberOfPlayersError unless game.length == 2

  # If either player's strategy is something other than "R", 
  # "P" or "S" (case-insensitive), raise NoSuchStrategyError.
  raise NoSuchStrategyError unless game[0][1].upcase.match(/[RPS]/)
  raise NoSuchStrategyError unless game[1][1].upcase.match(/[RPS]/)

  # Otherwise, return the name and move of the winning player. 
  # If both players play the same move, the first player is the winner.
  puts "winner #{rps_result(game[0], game[1])}"
  return rps_result(game[0], game[1])
end

def rps_tournament_winner(tournament)
  return rps_game_winner(tournament) unless tournament[0][0].is_a?(Array)
  return rps_game_winner([rps_tournament_winner(tournament[0]), rps_tournament_winner(tournament[1])])
end

# test_tournament = [ ["Armando", "S"], ["Dave", "S"] ]

# print rps_game_winner(test_tournament)

# test_tournament =
#     [
#         [ ["Armando", "P"], ["Dave", "S"] ],
#         [ ["Richard", "R"],  ["Michael", "S"] ],
#     ]

# test_tournament = [
#     [
#         [ ["Armando", "P"], ["Dave", "S"] ],
#         [ ["Richard", "R"],  ["Michael", "S"] ],
#     ],
#     [
#         [ ["Allen", "S"], ["Omer", "P"] ],
#         [ ["David E.", "R"], ["Richard X.", "P"] ]
#     ]
# ]

# print rps_tournament_winner(test_tournament)