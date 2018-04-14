class AddAboutToThoughtCheck < ActiveRecord::Migration[5.1]
  def change
    add_column :thought_checks, :about, :string
  end
end
