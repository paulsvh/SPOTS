class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.text :title
      t.integer :rating
      t.belongs_to :user, foreign_key: true
      t.belongs_to :spot, foreign_key: true

      t.timestamps
    end
  end
end
