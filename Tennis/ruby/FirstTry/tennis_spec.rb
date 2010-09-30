require 'rubygems'
require 'spec'
require 'tennis'

describe Tennis, "Score" do
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
    it "should be '#{game[:result]}' when Player 1 has won #{game[:player1]} balls and Player 2 has won #{game[:player2]} balls" do
      @tennis.player1_wins game[:player1]
      @tennis.player2_wins game[:player2]
      @tennis.score.should eql game[:result]
    end
  end
end

describe Tennis, "Deuce" do
  before :each do
    @tennis = Tennis.new
  end
  
  it "is deuce when both players has forty and score is equal" do
    @tennis.player1_wins 3
    @tennis.player2_wins 3
    @tennis.score.should eql "deuce"
  end
end

describe Tennis, "Advantage" do
  before :each do @tennis = Tennis.new end
  
  it "is advantage when deuce and Player 1 leads by one ball" do
    @tennis.player1_wins 4
    @tennis.player2_wins 3
    @tennis.score.should eql "advantage Player1"
  end
  
  it "is advantage when deuce and Player 2 leads by one ball" do
    @tennis.player1_wins 3
    @tennis.player2_wins 4
    @tennis.score.should eql "advantage Player2"
  end 
end

describe Tennis, "Win" do
  before :each do @tennis = Tennis.new end
  
  context "when Player 1 leads forty - love" do
    it "is Player1 that wins if he wins the next ball" do
      @tennis.player1_wins 3
      @tennis.score.should eql "forty - love"

      @tennis.player1_wins 1
      @tennis.score.should eql "Player1 wins"
    end
  end
  
  context "when Player 2 leads forty - love" do
    it "is Player2 that wins if he wins the next ball" do
      @tennis.player2_wins 3
      @tennis.score.should eql "love - forty"

      @tennis.player2_wins 1
      @tennis.score.should eql "Player2 wins"
    end
  end
    
  context "when deuce" do
    it "is Player 1 that wins if he win 2 balls in a row" do
      @tennis.player1_wins 3
      @tennis.player2_wins 3
      @tennis.score.should eql "deuce"

      @tennis.player1_wins 2
      @tennis.score.should eql "Player1 wins"
    end

    it "is Player2 wins if he win 2 balls in a row" do
      @tennis.player1_wins 4
      @tennis.player2_wins 4
      @tennis.score.should eql "deuce"

      @tennis.player2_wins 2
      @tennis.score.should eql "Player2 wins"
    end
  end
end
