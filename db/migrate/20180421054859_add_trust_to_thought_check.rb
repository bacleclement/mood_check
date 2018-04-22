class AddTrustToThoughtCheck < ActiveRecord::Migration[5.1]
  def change
    add_column :thought_checks, :trust, :string
  end
end
