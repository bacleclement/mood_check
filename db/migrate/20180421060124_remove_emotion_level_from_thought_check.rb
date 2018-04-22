class RemoveEmotionLevelFromThoughtCheck < ActiveRecord::Migration[5.1]
  def change
    remove_column :thought_checks, :emotion_level, :number
  end
end
