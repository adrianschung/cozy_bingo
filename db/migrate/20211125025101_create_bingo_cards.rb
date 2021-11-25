class CreateBingoCards < ActiveRecord::Migration[6.1]
  def change
    create_table :bingo_cards do |t|
      t.string :name
      t.integer :columns
      t.integer :rows
      t.datetime :start_date
      t.datetime :end_date
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
