class Nutrient < ActiveRecord::Base
  has_many :nutritions
  has_many :foods, :through => :nutritions
end
