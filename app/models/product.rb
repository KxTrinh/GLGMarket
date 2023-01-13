class Product < ApplicationRecord
  belongs_to :user
  has_many :posts

  validates :name, :description, :price, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
