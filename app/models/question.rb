class Question < ApplicationRecord
  validates :body, :title, :keyword, presence: true
end
