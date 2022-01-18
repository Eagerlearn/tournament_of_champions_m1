require 'rails_helper'
# As a user
# When I visit a competition's show page
# Then I see the competition's name, location, and sport
# And I see the name and hometown of all teams in this competition
# And I see the average age of all players in the competition
RSpec.describe 'Competition show page' do
  it 'I see the competitions name, location, and sport' do
    @competition_1 = Competition.create!(name: "comp one", location: "here", sport: "hockey")
    @competition_2 = Competition.create!(name: "comp two", location: "there", sport: "kickball")
    @competition_3 = Competition.create!(name: "comp three", location: "where ever", sport: "dodge ball")
    @competition_4 = Competition.create!(name: "comp four", location: "not here", sport: "frisbee")

    @team_1 = Team.create!(hometown: "philly", nickname: "winners")
    @team_2 = Team.create!(hometown: "phoenix", nickname: "sunners")
    @team_3 = Team.create!(hometown: "denver", nickname: "horses")

    TeamCompetition.create!(team: @team_1, competition: @competition_1)
    TeamCompetition.create!(team: @team_2, competition: @competition_1)
    visit "/competitions/#{@competition_1.id}"

    expect(page).to have_content(@competition_1.name)
    expect(page).to have_content(@competition_1.location)
    expect(page).to have_content(@competition_1.sport)
    expect(page).to have_content(@team_1.nickname)
    expect(page).to have_content(@team_2.nickname)
    expect(page).to have_content(@team_1.hometown)
    expect(page).to have_content(@team_2.hometown)
  end

  it 'I see the average age of all players in the competition' do
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

    visit "/competitions/#{@competition_1.id}"
    expect(page).to have_content("Average age of all players")
  end
end