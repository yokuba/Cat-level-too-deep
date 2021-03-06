class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :user, null: false
      t.string :title, null: false
      t.text :query, null: false
      t.integer :best_answer_id, default: false

      t.timestamps null: false
    end
  end
end
