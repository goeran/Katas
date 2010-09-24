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
    {:player1 => 2, :player2 => 3, :result => "thirty - forty"},
    {:player1 => 1, :player2 => 3, :result => "fifteen - forty"},
    {:player1 => 0, :player2 => 3, :result => "love - forty"},
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

describe Tennis, "deuce" do
  before :each do
    @tennis = Tennis.new
  end
  
  it "is deuce when both players has won 3 or more balls and score is equal" do
    @tennis.player1_wins 3
    @tennis.player2_wins 3
    @tennis.score.should eql "deuce"
  end
end

describe Tennis, "advantage" do
  before :each do @tennis = Tennis.new end
  
  it "is advantage when players has won 3 or more balls each and player1 is leading by one" do
    @tennis.player1_wins 4
    @tennis.player2_wins 3
    @tennis.score.should eql "advantage Player1"
  end
  
  it "is advantage when players has won 3 or more balls each and player2 is leading by one" do
    @tennis.player1_wins 3
    @tennis.player2_wins 4
    @tennis.score.should eql "advantage Player2"
  end 
end

describe Tennis, "win" do
  before :each do @tennis = Tennis.new end
    
  it "is win when Player1 lead 'forty - love' and win the ball" do
    @tennis.player1_wins 3
    @tennis.score.should eql "forty - love"
    
    @tennis.player1_wins 1
    @tennis.score.should eql "Player1 wins"
  end
  
  it "is win when Player2 lead 'love - forty' and win the ball" do
    @tennis.player2_wins 3
    @tennis.score.should eql "love - forty"
    
    @tennis.player2_wins 1
    @tennis.score.should eql "Player2 wins"
  end
  
  it "is win when both players har won at least 3 balls each and Player1 win 2 balls in a row" do
    @tennis.player1_wins 3
    @tennis.player2_wins 3
    @tennis.score.should eql "deuce"
    
    @tennis.player1_wins 2
    @tennis.score.should eql "Player1 wins"
  end
  
  it "is win when both players has won at least 3 balls each and Player2 win 2 balls in a row" do
    @tennis.player1_wins 4
    @tennis.player2_wins 4
    @tennis.score.should eql "deuce"
    
    @tennis.player2_wins 2
    @tennis.score.should eql "Player2 wins"
  end
end
