class Team < ApplicationRecord
  belongs_to :bingo_card
  has_many :team_users
  has_many :users, through: :team_users
  accepts_nested_attributes_for :team_users, reject_if: :all_blank, allow_destroy: true
end
