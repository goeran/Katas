# To change this template, choose Tools | Templates
# and open the template in the editor.

class Tennis
  def initialize
    @balls_player_one = 0
    @balls_player_two = 0
    @score = { 0 => :love, 1 => :fifteen, 2 => :thirty, 3 => :forty }
  end

  def score
    return "#{leading_player} wins" if one_player_has_more_than :forty and leading_player_leads_by 2
    return "deuce" if both_players_have :forty and score_is_equal
    return "advantage #{leading_player}" if both_players_have :forty and leading_player_leads_by 1
    "#{pretty @balls_player_one} - #{pretty @balls_player_two}"
  end

  def one_player_has_more_than score
    score = 3 if score == :forty
    @balls_player_one > score or @balls_player_two > score
  end

  def one_player_has score
    score = 0 if score == :love
    score = 1 if score == :fifteen
    score = 2 if score == :thirty
    @balls_player_one == score or @balls_player_two == score
  end

  def score_is_equal
    @balls_player_one == @balls_player_two
  end

  def leading_player_leads_by balls
    @balls_player_one >= @balls_player_two + balls or
      @balls_player_two >= @balls_player_one + balls
  end

  def leading_player
    return "player one" if @balls_player_one > @balls_player_two
    "player two"
  end

  def both_players_have score
    score = 3 if score == :forty
    @balls_player_one >= score and @balls_player_two >= score
  end

  def pretty balls
    @score[balls].to_s
  end

  def score_player_one
    @balls_player_one += 1
  end

  def score_player_two
    @balls_player_two += 1
  end

  def play p1, p2
    p1.times { score_player_one }
    p2.times { score_player_two }
  end
end
