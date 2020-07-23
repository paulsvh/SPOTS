class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
      t.string :name
      t.string :location
      t.string :description
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
