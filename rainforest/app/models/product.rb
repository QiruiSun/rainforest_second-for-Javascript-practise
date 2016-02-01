class Product < ActiveRecord::Base
  validates :name, :description, :url, presence: true
  validates :price_in_cent, numericality: {integer_only: true}
end
