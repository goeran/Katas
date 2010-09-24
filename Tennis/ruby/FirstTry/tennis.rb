class Tennis
  class Semantics
    def initialize &block
      @block = block
    end
    
    def method_missing method
      @block.call
    end
  end
  
  def initialize
    @wins_player1 = 0
    @wins_player2 = 0
  end
  
  def score
    if both_players_has_won(3).or_more and score_is_equal then
      "deuce"
    elsif both_players_has_won(3).or_more and leading_player_leads_by(1) then
      "advantage " + leading_player
    elsif one_player_has_won 4 and one_player_has_won 0 then
      leading_player + " wins"
    elsif both_players_has_won(3).or_more and leading_player_leads_by 2 then
      leading_player + " wins"
    else
      "#{print @wins_player1} - #{print @wins_player2}"
    end
  end
  
  def both_players_has_won balls
    Semantics.new do
      @wins_player1 >= balls and @wins_player2 >= balls
    end
  end
  
  def one_player_has_won balls
    @wins_player1 == balls or @wins_player2 == balls
  end
  
  def leading_player_leads_by balls
    @wins_player1 >= @wins_player2 + balls or 
    @wins_player2 >= @wins_player1 + balls
  end
  
  def leading_player_leads_by balls
    @wins_player1 == @wins_player2 + balls or @wins_player2 == @wins_player1 + balls
  end
  
  def leading_player
    if @wins_player1 > @wins_player2 then 
      return "Player1" 
    end
    "Player2"
  end
  
  def player1_has_won balls
    @wins_player1 > balls
  end
  
  def player2_has_more_than balls
    @wins_player2 > balls
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