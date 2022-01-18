require 'rails_helper'

RSpec.describe Competition do
  describe 'relationships' do
    it { should have_many :team }
  end
    it 'can caluculate the average age of players in the competition' do
      @competition_1 = Competition.create!(name: "comp one", location: "here", sport: "hockey")
      @competition_2 = Competition.create!(name: "comp two", location: "there", sport: "kickball")
      @competition_3 = Competition.create!(name: "comp three", location: "where ever", sport: "dodge ball")
      @competition_4 = Competition.create!(name: "comp four", location: "not here", sport: "frisbee")

      @team_1 = Team.create!(hometown: "philly", nickname: "winners")
      @team_2 = Team.create!(hometown: "phoenix", nickname: "sunners")
      @team_3 = Team.create!(hometown: "denver", nickname: "horses")

      @player_1 = @team_1.players.create!(name: "Peter", age: 40)
      @player_2 = @team_2.players.create!(name: "Paul", age: 35)
      @player_3 = @team_1.players.create!(name: "John", age: 20)
      @player_4 = @team_2.players.create!(name: "Ringo", age: 25)

      TeamCompetition.create!(team: @team_1, competition: @competition_1)
      TeamCompetition.create!(team: @team_2, competition: @competition_1)

      expect(@competition_1.average_age_of_all_players).to eq(30)
    end
end