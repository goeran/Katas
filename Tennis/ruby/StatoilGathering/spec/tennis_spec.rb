# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'tennis'

describe Tennis do
  before(:each) do
    @tennis = Tennis.new
  end

  describe "score" do
    it "should be 'love - love' when 0-0" do
      @tennis.score.should eql "love - love"
    end

    it "should be 'fifteen - love' when 1-0" do
      @tennis.score_player_one
      @tennis.score.should eql "fifteen - love"
    end

    it "should be 'love - fifteen' when 0-1" do
      @tennis.score_player_two
      @tennis.score.should eql "love - fifteen"
    end

    it "should be 'thirty - love' when 2-0" do
      2.times { @tennis.score_player_one }
      @tennis.score.should eql "thirty - love"
    end
  end
end

