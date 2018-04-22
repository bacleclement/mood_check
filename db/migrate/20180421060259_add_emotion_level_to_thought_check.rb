class AddEmotionLevelToThoughtCheck < ActiveRecord::Migration[5.1]
  def change
    add_column :thought_checks, :emotion_level, :string
  end
end
