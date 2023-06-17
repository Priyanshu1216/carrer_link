class RemoveDateFromApply < ActiveRecord::Migration[7.0]
  def change
    remove_column :applies, :apply_date
  end
end
