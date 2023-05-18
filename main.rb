require_relative "element"
require_relative "player"
require_relative "history"

#########################################
#     CS 381 - Programming Lab #3		    #
#																				#
#  Sheyar Abdullah					 						#
#  abdullsh@oregonstate.edu	            #
#																				#
#########################################


def get_choice()
	case gets.chomp
	when '1' then
		return StupidBot.new('StupidBot', History.new)
	when '2' then
		return RandomBot.new('RandomBot', History.new)
	when '3' then
		return IterativeBot.new('IterativeBot', History.new)
	when '4' then
		return LastPlayBot.new('LastPlayBot', History.new)
	when '5' then
		return Human.new('Human', History.new)
	else
		return ''
	end
end

def player_prompt()
	puts 'Please choose two players:'
	puts '(1) StupidBot', '(2) RandomBot', '(3) IterativeBot', '(4) LastPlayBot', '(5) Human'
end

def update_scores(p1, p2, result)
	if result == 'Player 1 won the round'
		p1.history.add_score()
	elsif result == 'Player 2 won the round'
		p2.history.add_score()
	end
end


def game(rounds)

	puts 'Welcome to Rock, Paper, Scissors, Lizard, Spock!', ''
	player_prompt()

	p1, p2 = '', ''
	print 'Select player 1: '
	p1 = get_choice()
	print 'Select player 2: '
	p2 = get_choice()

	while p1 == '' or p2 == ''
		puts 'Invalid choice(s) - start over', ''
		print 'Select player 1: '
		p1 = get_choice()
		print 'Select player 2: '
		p2 = get_choice()
	end

	puts "#{p1.name} vs. #{p2.name}", ''

	for round in 1..rounds
		puts "Round #{round}:"
		p1move = p1.play()
		p2move = p2.play()
		p1.history.log_opponent_play(p2move)
		p2.history.log_opponent_play(p1move)
		puts "Player 1 chose #{p1move.name}"
		puts "Player 2 chose #{p2move.name}"
		puts result = p1move.compare_to(p2move), ''
		update_scores(p1, p2, result[1])
	end

	puts "Final score is #{p1.history.score} to #{p2.history.score}"
	if p1.history.score > p2.history.score
		puts "Player 1 wins"
	elsif  p1.history.score < p2.history.score
		puts "Player 2 wins"
	elsif p1.history.score == p2.history.score
		puts "Game was a draw"
	end

end



# Main Program (should be last)
n_rounds = 5
# call to kick off the game
game(n_rounds)
