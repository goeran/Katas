require 'rubygems'
require 'spec'
require 'tennis'
require 'tennisdsl'

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
    {:player1 => 10, :player2 => 8, :result => "Player 1 wins"},
    {:player1 => 10, :player2 => 12, :result => "Player 2 wins"},
    {:player1 => 10, :player2 => 9, :result => "advantage Player 1"},
    {:player1 => 11, :player2 => 12, :result => "advantage Player 2"},    
    ]    

  before :each do
    @tennis = Tennis.new
  end
  
  @games.each do |game|
    it "should be '#{game[:result]}' when Player 1 has won #{game[:player1]} balls and Player 2 has won #{game[:player2]} balls" do
      player one wins game[:player1]
      player two wins game[:player2]
      @tennis.score.should eql game[:result]
    end
  end
end

describe Tennis, "Deuce" do
  before :each do
    @tennis = Tennis.new
  end
  
  context "when 'forty - forty'" do
    it "is deuce" do
      player one wins 3
      player two wins 3
      @tennis.score.should eql "deuce"
    end
  end
  
  context "When both players has won more than 3 balls each and score is equal" do
    it "is deuce" do
      player one wins 6
      player two wins 6
      @tennis.score.should eql "deuce"
    end
  end
end

describe Tennis, "Advantage" do
  before :each do @tennis = Tennis.new end
  
  context "When deuce" do
    context "and Player 1 leads by one ball" do
      it "is advantage to Player 1" do
        player one wins 4
        player two wins 3
        @tennis.score.should eql "advantage Player 1"
      end
    end
    
    context "and Player 2 leads by one ball" do
      it "is advantage to Player 2" do
        player one wins 3
        player two wins 4
        @tennis.score.should eql "advantage Player 2"
      end
    end
  end  
end

describe Tennis, "Win" do
  before :each do @tennis = Tennis.new end
  
  context "when 'forty - love'" do
    context "and Player 1 wins the next ball" do
      it "is Player 1 that wins" do
        player one wins 3
        @tennis.score.should eql "forty - love"

        player one wins 1
        @tennis.score.should eql "Player 1 wins"
      end
    end
    
    context "and Player 2 wins the next ball" do
      it "is Player 2 that wins" do
        player two wins 3
        @tennis.score.should eql "love - forty"

        player two wins 1
        @tennis.score.should eql "Player 2 wins"
      end
    end
  end
  
  context "when deuce" do
    context "and Player 1 wins two balls in a row" do
      it "is Player 1 that wins" do
        player one wins 3
        player two wins 3
        @tennis.score.should eql "deuce"

        player one wins 2
        @tennis.score.should eql "Player 1 wins"
      end
    end
    
    context "and Player 2 wins two balls in a row" do
      it "is Player 2 that wins" do
        player one wins 4
        player two wins 4
        @tennis.score.should eql "deuce"

        player two wins 2
        @tennis.score.should eql "Player 2 wins"
      end
    end
  end
end
