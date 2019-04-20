class AddUsersPollsQuestionsAnswerchoicesResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, null: false

      t.timestamps
    end
    add_index :users, :username, unique: true

    create_table :polls do |t|
      t.string :title, null: false
      t.integer :user_id, null: false

      t.timestamps
    end

    create_table :questions do |t|
      t.text :body, null: false

      t.timestamps
    end

    create_table :answer_choices do |t|
      t.text :answer, null: false

      t.timestamps
    end

    create_table :responses do |t|
      t.integer :user_id, null: false
      t.integer :question_id, null: false
      t.integer :answer_choice_id, null: false

      t.timestamps
    end
  end
end
