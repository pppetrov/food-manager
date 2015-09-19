class Food < ActiveRecord::Base
  belongs_to :food_group
  has_many :nutritions
  has_many :nutrients, :through => :nutritions
  has_many :weights
end
