class Food < ActiveRecord::Base
  belongs_to :food_group
  has_many :nutritions
  has_many :nutrients, :through => :nutritions
  has_many :weights

  include PgSearch
  pg_search_scope :search_by_desc, :against => [:short_desc, :long_desc], :using => {
      :tsearch => {:prefix => true}
    } 
  
end

