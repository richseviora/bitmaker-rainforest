class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  validates_length_of :comment, minimum: 1
end
