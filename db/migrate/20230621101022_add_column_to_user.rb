class AddColumnToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :dob, :date
    add_column :users, :qualification, :string
    add_column :users, :skills, :string
    add_column :users, :hobbies, :string
    add_column :users, :description, :text
    add_column :users, :address, :text
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
  end
end
