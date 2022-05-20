class AddDetailsToAnswers < ActiveRecord::Migration[6.1]
  def change
    add_column :answers, :correct_rate, :integer
    add_column :answers, :forgotten_words, :string
  end
end
