class Product < ActiveRecord::Base
  validates_presence_of :name, :description
  has_many :reviews
  has_many :users, through: :reviews


  def price_in_dollars
    self.price_in_cents / 100.0
  end
end
