class Post < ApplicationRecord
  belongs_to :user

  validates :title, :content, presence: true
  validates :price, numericality: { only_integer: true }
  validates :price, comparison: { greater_than_or_equal_to: 0 }

  has_many_attached :photos
end
