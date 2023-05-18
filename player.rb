require_relative "element"
require_relative "history"

class Player
  attr_reader :name, :history

  def initialize(name, history)
    @name = name
    @history = history
  end

  def play()
    fail "This method should be overridden"
  end

end

class StupidBot < Player

  def play()
    move = $moves[0]
    @history.log_play(move)
    return move
  end

end

class RandomBot < Player

  def play()
    move = $moves.sample
    @history.log_play(move)
    return move
  end

end

class IterativeBot < Player

  def play()
    move = $moves[(@history.plays.length)%5]
    @history.log_play(move)
    return move
  end

end

class LastPlayBot < Player

  def play()
    if @history.opponent_plays.length == 0
      move = $moves[0]
    else
      move = @history.opponent_plays[-1]
    end
    @history.log_play(move)
    return move
  end

end

class Human < Player

  def play()
    move = ''
    while move == ''
      puts '(1) Rock', '(2) Paper', '(3) Scissors', '(4) Lizard', '(5) Spock'
      print 'Enter your move: '
      case gets.chomp
      when '1' then
        move = $moves[0]
      when '2' then
        move = $moves[1]
      when '3' then
        move = $moves[2]
      when '4' then
        move = $moves[3]
      when '5' then
        move = $moves[4]
      else
        puts 'Invalid move - try again'
      end
    end
    @history.log_play(move)
    return move
  end

end

