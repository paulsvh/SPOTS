class AddFacebookUidToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :uid, :text
  end
end
