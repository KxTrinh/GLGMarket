class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  # has_many :products
  # has_many :bought_products, through: :posts, source: :product, dependent: :destroy

  validates :name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  validates :age, numericality: { only_integer: true }
  validates :age, comparison: { greater_than: 0 }

  has_one_attached :avatar
end
