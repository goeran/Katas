# To change this template, choose Tools | Templates
# and open the template in the editor.

class Tennis
  def initialize
    @balls_player_one = 0
    @balls_player_two = 0
  end

  def score
    "#{pretty @balls_player_one} - #{pretty @balls_player_two}"
  end

  def pretty balls
    return "love" if balls == 0
    return "fifteen" if balls == 1
    return "thirty" if balls == 2
  end

  def score_player_one
    @balls_player_one += 1
  end

  def score_player_two
    @balls_player_two += 1
  end
end
