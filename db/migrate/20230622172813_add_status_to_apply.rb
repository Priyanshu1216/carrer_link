class AddStatusToApply < ActiveRecord::Migration[7.0]
  def change
    add_column :applies, :status, :integer, default: 0
  end
end
