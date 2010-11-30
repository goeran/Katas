# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'tennis'

def play(p1, p2, result)
  { :p1 => p1, :p2 => p2, :result => result }
end

def test game
  it "should be '#{game[:result]}' when #{game[:p1]}-#{game[:p2]}" do
        @tennis.play(game[:p1], game[:p2])
        @tennis.score.should eql game[:result]
  end
end

describe Tennis do
  before(:each) do
    @tennis = Tennis.new
  end

  describe "score" do
    [
      play(0, 0, "love - love"),
      play(1, 0, "fifteen - love"),
      play(0, 1, "love - fifteen"),
      play(2, 0, "thirty - love"),
      play(2, 1, "thirty - fifteen"),
      play(2, 2, "thirty - thirty"),
      play(3, 0, "forty - love"),
      play(3, 2, "forty - thirty"),
    ].each do |game|
      test game
    end
  end

  describe "deuce" do
    [
      play(3, 3, "deuce"),
      play(4, 4, "deuce"),
      play(5, 5, "deuce"),
    ].each do |game|
      test game 
    end
  end

  describe "advantage" do
    [
      play(4, 3, "advantage player one"),
      play(3, 4, "advantage player two"),
      play(5, 4, "advantage player one"),
      play(9, 10, "advantage player two"),
    ].each do |game|
      test game
    end
  end

  describe "win" do
    [
      play(4, 0, "player one wins"),
      play(0, 4, "player two wins"),
      play(4, 1, "player one wins"),
      play(1, 4, "player two wins"),
      play(4, 2, "player one wins"),
      play(2, 4, "player two wins")
    ].each do |game|
      test game
    end
  end

  describe "win after advantage" do
    [
      play(5, 3, "player one wins"),
      play(10, 8, "player one wins"),
      play(10, 12, "player two wins"),
    ].each do |game|
      test game
    end
  end
end

