class RemoveClientIdFromJobs < ActiveRecord::Migration[7.0]
  def change
    remove_column :jobs, :client_id, :integer
  end
end
