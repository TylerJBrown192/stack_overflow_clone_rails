class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question_content
      t.string :question_title
      t.integer :user_id

      t.timestamps
    end
  end
end
