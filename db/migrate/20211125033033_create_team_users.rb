class CreateTeamUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :team_users do |t|
      t.references :team
      t.references :user
      t.index [:user_id, :team_id], unique: true
      t.timestamps
    end
  end
end
