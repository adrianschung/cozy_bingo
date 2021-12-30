require 'rails_helper'

RSpec.describe BingoCard, type: :model do
  it "finds available users without a team" do
    user1 = create(:user)
    user2 = create(:user)
    bingo_card = create(:bingo_card)
    team = bingo_card.teams.create(name: 'team1')
    user1_team = user1.team_users.create(team: team)

    expect(bingo_card.available_users).not_to include(user1)
    expect(bingo_card.available_users).to include(user2)
  end
end
