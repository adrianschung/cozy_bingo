class BingoCard < ApplicationRecord
  enum status: { hidden: 0, active: 1, ended: 2}
end
