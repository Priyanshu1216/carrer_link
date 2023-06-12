class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :salary
      t.string :experience
      t.text :location
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
