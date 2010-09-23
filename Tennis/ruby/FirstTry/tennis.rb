class Tennis
  def initialize
    @wins_player1 = 0
    @wins_player2 = 0
  end
  
  def score
    return "#{print @wins_player1} - #{print @wins_player2}"
  end
  
  def print balls_won
    if balls_won == 1 then return "fifteen" end
    if balls_won == 2 then return "thirty" end  
    return "love"
  end
  
  def player1_wins balls
    @wins_player1 += balls
  end
  
  def player1_wins_ball 
    @wins_player1 += 1
  end
  
  def player2_wins_ball
    @wins_player2 += 1
  end
  
  def player2_wins balls
    @wins_player2 += balls
  end
end