class AddCorrectAnswerToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :correct_answer, :text, null: false
  end
end
