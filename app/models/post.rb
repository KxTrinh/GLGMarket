class Post < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :title, :content, presence: true
end