class AddColumnToProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :name, :string
    add_column :profiles, :email, :string
    add_column :profiles, :contact, :string
    add_column :profiles, :dob, :date
    add_column :profiles, :skills, :string
    add_column :profiles, :qualification, :string
    add_column :profiles, :address, :text
  end
end
