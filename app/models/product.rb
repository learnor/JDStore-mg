class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :favorites
  has_many :fans, through: :favorites, source: :user
  belongs_to :category

  validates :title, :description, :quantity, :category, :price, presence: true
  validates :quantity, :price, numericality: { greater_than_or_equal_to: 0 }
end
