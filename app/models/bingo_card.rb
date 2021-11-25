class BingoCard < ApplicationRecord
  enum status: { hidden: 0, active: 1, ended: 2}
  has_many :teams
end
