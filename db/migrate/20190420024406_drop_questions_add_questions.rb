class DropQuestionsAddQuestions < ActiveRecord::Migration[5.2]
  def change
    drop_table :questions

    create_table :questions do |t|
      t.integer :poll_id, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
