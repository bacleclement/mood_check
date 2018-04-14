class RemoveTypeFromThoughtCheck < ActiveRecord::Migration[5.1]
  def change
    remove_column :thought_checks, :type, :string
  end
end
