class Question < ApplicationRecord
  validates :body, :title, :keyword, presence: true
  belongs_to :user
  has_many :answers, dependent: :destroy
end
