class CreateJoinTableJobApplicant < ActiveRecord::Migration[7.0]
  def change
    create_join_table :jobs, :applicants do |t|
      # t.index [:job_id, :applicant_id]
      # t.index [:applicant_id, :job_id]
    end
  end
end
