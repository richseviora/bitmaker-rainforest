class Product < ActiveRecord::Base
  validates_presence_of :name, :description


  def price_in_dollars
    self.price_in_cents / 100.0
  end
end
