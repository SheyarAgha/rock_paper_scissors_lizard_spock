class History
  attr_accessor :plays, :opponent_plays, :score

  def initialize
    @score = 0
    @plays = Array.new
    @opponent_plays = Array.new
  end

  def log_play(move)
    @plays.push(move)
  end

  def log_opponent_play(move)
    @opponent_plays.push(move)
  end

  def add_score()
    @score += 1
  end

end
