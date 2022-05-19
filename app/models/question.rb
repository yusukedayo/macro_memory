class Question < ApplicationRecord
  validates :body, :title, :keyword, presence: true
  belongs_to :user
end
