class BingoCard < ApplicationRecord
  enum status: { hidden: 0, active: 1, ended: 2}
  has_many :teams

  def available_users
    team_ids = teams.map(&:id)
    p team_ids
    user_ids = User.joins(:teams).where(teams: {id: team_ids})
    p user_ids
    User.where.not(id: user_ids)
  end
end
