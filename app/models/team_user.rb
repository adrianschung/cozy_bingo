class TeamUser < ApplicationRecord
  belongs_to :team
  belongs_to :user
  validates :user_id, uniqueness: { scope: :team_id, message: "already belongs to team" }
end
