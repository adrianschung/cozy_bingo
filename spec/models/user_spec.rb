require 'rails_helper'

RSpec.describe User, type: :model do
  it 'validates the presence of username' do
    user = build(:user, username: nil)

    expect(user).to_not be_valid
    expect(user.errors.messages[:username]).to eq(["can't be blank"])
  end

  it 'validates the presence of a password' do
    user = build(:user, password: nil)

    expect(user).to_not be_valid
    expect(user.errors.messages[:password]).to eq(["can't be blank"])
  end

  it 'validates the uniqueness of username' do
    user1 = create(:user)
    user2 = build(:user)

    expect(user1).to be_valid
    expect(user2).to_not be_valid
    expect(user2.errors.messages[:username]).to eq(["has already been taken"])
  end
end
