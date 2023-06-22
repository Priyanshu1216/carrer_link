class RemoveColumnFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :dob, :date
    remove_column :users, :qualification, :string
    remove_column :users, :skills, :string
    remove_column :users, :description, :text
    remove_column :users, :hobbies, :string
    remove_column :users, :address, :text
  end
end
