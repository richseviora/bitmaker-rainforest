class Product < ActiveRecord::Base
  def price_in_dollars
    self.price_in_cents / 100.0
  end
end
