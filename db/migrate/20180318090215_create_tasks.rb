class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.references :thought_check, foreign_key: true
      t.string :type
      t.string :title
      t.string :hour
      t.boolean :state
      t.datetime :created_at
      t.text :description

      t.timestamps
    end
  end
end
