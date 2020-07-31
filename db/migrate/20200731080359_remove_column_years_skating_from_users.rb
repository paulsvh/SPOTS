class RemoveColumnYearsSkatingFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :years_skating
  end
end
