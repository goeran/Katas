class Tennis
  class Semantics
    def initialize &block
      @block = block
    end
    
    def or_more
      @block.call
    end
  end
  
  def initialize
    @wins_player1 = 0
    @wins_player2 = 0
  end
  
  def score
    if both_players_has_won(3).or_more and score_is_equal then
      "duece"
    elsif both_players_has_won(3).or_more and leading_player_leads_by(1) then
      "advantage player1"
    else
      "#{print @wins_player1} - #{print @wins_player2}"
    end
  end
  
  def both_players_has_won balls
    semantics = Semantics.new do
      @wins_player1 >= balls and @wins_player2 >= balls
    end
  end
  
  def leading_player_leads_by balls
    
  end
  
  def both exp1, exp2
    exp1 and exp2
  end
  
  def player1_has_won balls
    @wins_player1 > balls
  end
  
  def player2_has_more_than balls
    @wins_player2 > balls
  end
  
  def both_players_has_won_3_or_more_balls
    @wins_player1 >= 3 and @wins_player2 >= 3
  end
  
  def score_is_equal 
    @wins_player1 == @wins_player2
  end
  
  def print balls_won
    if balls_won == 1 then return "fifteen" end
    if balls_won == 2 then return "thirty" end
    if balls_won == 3 then return "forty" end
    
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