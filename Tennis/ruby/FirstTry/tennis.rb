require 'dsl'

class Tennis
  include Dsl
  
  def initialize
    @wins_player1 = 0
    @wins_player2 = 0
    @score = {
      :love => 0,
      :fifteen => 1,
      :thirty => 2,
      :forty => 3
    }
  end
    
  def score
    is deuce! if both players has :forty 
    is advantage! if both players has :forty and leading player leads by 1
    is win! if one player has more than :forty and one player has :love
    is win! if both players has :forty and leading player leads by 2
    is still playing if !deuce? and !advantage? and !win?
    return @result
  end
  
  def is score
    @result = score
  end
  
  def deuce!
    @result = "deuce"
  end
  
  def advantage!
    @result = "advantage " + leading_player
  end
  
  def win!
    @result = leading_player + " wins"
  end
  
  def still_playing *args
    @result = "#{print @wins_player1} - #{print @wins_player2}"
  end
    
  def deuce? 
    both_players_has :forty
  end
  
  def advantage?
    both_players_has :forty and leading_player_leads_by 1
  end
  
  def win?
    (one_player_has_more_than :forty and one_player_has :love) or
    (both_players_has :forty and leading_player_leads_by 2)
  end
  
  def both_players_has score
    @wins_player1 >= @score[score] and @wins_player2 >= @score[score]
  end
  
  def leading_player
    return "Player 1" if @wins_player1 > @wins_player2
    return "Player 2"
  end

  def leading_player_leads_by balls
    @wins_player1 == @wins_player2 + balls or @wins_player2 == @wins_player1 + balls
  end
  
  def one_player_has score
    @wins_player1 == @score[score] or @wins_player2 == @score[score]
  end
  
  def one_player_has_more_than balls
    @wins_player1 > @score[balls] or @wins_player2 > @score[balls]
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
  
  def player2_wins balls
    @wins_player2 += balls
  end
end