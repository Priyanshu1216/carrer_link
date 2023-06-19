class RemoveApplicantFromApply < ActiveRecord::Migration[7.0]
  def change
    remove_reference :applies, :applicant, null: false, foreign_key: true
  end
end
