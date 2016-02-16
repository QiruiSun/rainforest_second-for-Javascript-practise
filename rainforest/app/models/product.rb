class Product < ActiveRecord::Base
  has_many :users, through: :reviews
  has_many :reviews

  validates :name, :description, presence: true
  validates :price_in_cent, numericality: {integer_only: true}

  def formatted_price
    price_in_dollars = price_in_cent.to_f / 100
    sprintf("%.2f", price_in_dollars)
  end

end
