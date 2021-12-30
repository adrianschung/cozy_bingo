require 'rails_helper'

RSpec.describe TeamUser, type: :model do
  it "validates the uniqueness of user on team" do
    team = create(:team)
    user = create(:user)
    join_team = team.team_users.create(user: user)
    join_team_again = team.team_users.build(user: user)
    
    expect(join_team).to be_valid
    expect(join_team_again).to_not be_valid
    expect(join_team_again.errors.messages[:user_id]).to eq(["already belongs to team"])
  end
end
