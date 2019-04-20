class DropAnswersAddAnswers < ActiveRecord::Migration[5.2]
  def change
    drop_table :answer_choices

    create_table :answer_choices do |t|
      t.integer :question_id, null: false
      t.text :answer, null: false

      t.timestamps
    end
  end
end
