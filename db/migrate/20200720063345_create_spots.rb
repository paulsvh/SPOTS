class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
      t.text :name
      t.text :location
      t.text :description
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
