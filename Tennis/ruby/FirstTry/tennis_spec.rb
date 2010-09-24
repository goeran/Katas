require 'rubygems'
require 'spec'
require 'tennis'

describe Tennis, "score" do
  @games = [
    {:player1 => 0, :player2 => 0, :result => "love - love"},
    {:player1 => 1, :player2 => 0, :result => "fifteen - love"},
    {:player1 => 0, :player2 => 1, :result => "love - fifteen"},
    {:player1 => 1, :player2 => 1, :result => "fifteen - fifteen"},
    {:player1 => 2, :player2 => 0, :result => "thirty - love"},
    {:player1 => 2, :player2 => 1, :result => "thirty - fifteen"},
    {:player1 => 2, :player2 => 2, :result => "thirty - thirty"},
    {:player1 => 0, :player2 => 2, :result => "love - thirty"},
    {:player1 => 1, :player2 => 2, :result => "fifteen - thirty"},
    {:player1 => 3, :player2 => 0, :result => "forty - love"},
    {:player1 => 3, :player2 => 1, :result => "forty - fifteen"},
    {:player1 => 3, :player2 => 2, :result => "forty - thirty"},
    {:player1 => 3, :player2 => 3, :result => "duece"},
    {:player1 => 4, :player2 => 3, :result => "advantage player1"},
    
    
    ]    

  before :each do
    @tennis = Tennis.new
  end
  
  @games.each do |game|
    it "should be '#{game[:result]}' when #{game[:player1]} - #{game[:player2]}" do
      @tennis.player1_wins game[:player1]
      @tennis.player2_wins game[:player2]
      @tennis.score.should eql game[:result]
    end
  end
end