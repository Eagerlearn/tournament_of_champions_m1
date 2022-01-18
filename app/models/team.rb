class Team < ApplicationRecord
  has_many :team_competitions
  has_many :players
  has_many :competitions, through: :team_competitions
end