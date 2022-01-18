class Competition < ApplicationRecord
  has_many :team_competitions
  has_many :team, through: :team_competitions

  def self.average_age_of_all_players
    require "pry"; binding.pry
    joins(:team)
    .where(team: :player[:team_id])
  end
end