class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :negative_proof
      t.text :positive_proof
      t.text :alternative
      t.text :worst_case
      t.text :best_case
      t.text :realistic
      t.string :thought_effect
      t.text :friend
      t.string :new_trust
      t.string :new_emotion
      t.string :new_emotion_level
      t.references :thought_check, foreign_key: true

      t.timestamps
    end
  end
end
