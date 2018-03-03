class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category
  has_many :review
  accepts_nested_attributes_for :review

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

end
