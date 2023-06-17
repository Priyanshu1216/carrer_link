class DropApplicantsJobs < ActiveRecord::Migration[7.0]
  def change
    drop_table :applicants_jobs
  end
end
