class CreateApplicants < ActiveRecord::Migration[7.0]
  def change
    create_table :applicants do |t|
      t.string :name
      t.string :email
      t.integer :contact
      t.text :skills

      t.timestamps
    end
  end
end
