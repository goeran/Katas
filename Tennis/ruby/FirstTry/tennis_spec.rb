require 'rubygems'
require 'spec'
require 'tennis'

describe Tennis, "score" do
  before :each do
    @tennis = Tennis.new
  end
  
  it "should be 'love - love' when game starts" do
    @tennis.score.should eql "love - love"
  end
  
  it "should be 'fifteen - love' when player 1 has won the first ball" do
    @tennis.player1_wins_ball
    @tennis.score.should eql "fifteen - love"
  end
  
  it "should be 'love - fifteen' when player 2 has won the first ball" do
    @tennis.player2_wins_ball
    @tennis.score.should eql "love - fifteen"
  end
  
  it "should be 'fifteen - fifteen' when both players has won 1 ball each" do
    @tennis.player1_wins_ball
    @tennis.player2_wins_ball
    @tennis.score.should eql "fifteen - fifteen"
  end
  
  it "should be 'thirty - love' when player 1 has won two balls" do
    @tennis.player1_wins 2
    @tennis.score.should eql "thirty - love"
  end
  
  it "should be 'love - thirty' when player 2 has won two balls" do
    @tennis.player2_wins 2
    @tennis.score.should eql "love - thirty"
  end
end