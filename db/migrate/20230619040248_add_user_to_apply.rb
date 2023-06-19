class AddUserToApply < ActiveRecord::Migration[7.0]
  def change
    add_reference :applies, :user
  end
end
