class Product < ActiveRecord::Base
  validates_presence_of :name, :description
  validates_numericality_of(:price_in_cents, :only_integer => true)

  def price_in_dollars
    self.price_in_cents / 100.0
  end
end
