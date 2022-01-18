require 'rails_helper'
# As a user
# When I visit the competion index
# Then I see the names of all competitions
# Each competition name links to its show page
RSpec.describe 'Competition index page' do
  it 'I see the names of all competitions' do
    @competition_1 = Competition.create!(name: "comp one", location: "here", sport: "hockey")
    @competition_2 = Competition.create!(name: "comp two", location: "there", sport: "kickball")
    @competition_3 = Competition.create!(name: "comp three", location: "where ever", sport: "dodge ball")
    @competition_4 = Competition.create!(name: "comp four", location: "not here", sport: "frisbee")
    visit '/competitions'

    expect(page).to have_content(@competition_1.name)
    expect(page).to have_content(@competition_2.name)
    expect(page).to have_content(@competition_3.name)
    expect(page).to have_content(@competition_4.name)
    
    click_link "My Show Page Link #{@competition_1.id}"
    expect(current_path).to eq("/competitions/#{@competition_1.id}")
  end
end