class AddForeignKeyToSpots < ActiveRecord::Migration[6.0]
  def change
    add_reference :spots, :creator, references: :users, index: true
    add_foreign_key :spots, :users, column: :creator_id
  end
end
