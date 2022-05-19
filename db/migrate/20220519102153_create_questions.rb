class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :title,             null: false
      t.text :body,             null: false
      t.text :hint
      t.string :keyword,             null: false

      t.timestamps
    end
  end
end
