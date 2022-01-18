class Competition < ApplicationRecord
  has_many :team_competitions
  has_many :team, through: :team_competitions
end