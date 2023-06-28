class AddSkillsetToJob < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :skillset, :string
  end
end
