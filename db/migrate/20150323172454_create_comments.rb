class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment_content
      t.integer :question_id
      t.integer :user_id
      t.boolean :first_response, default: false

      t.timestamps
    end
  end
end
