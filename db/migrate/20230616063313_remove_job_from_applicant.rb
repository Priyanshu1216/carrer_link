class RemoveJobFromApplicant < ActiveRecord::Migration[7.0]
  def change
    remove_column :applicants, :job_id
  end
end
