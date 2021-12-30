class BingoCard < ApplicationRecord
  enum status: { hidden: 0, active: 1, ended: 2}
  has_many :teams

  def available_users
    team_ids = teams.map(&:id)
    User.where.not(id: User.joins(:teams).where(teams: {id: team_ids}))
  end
end
