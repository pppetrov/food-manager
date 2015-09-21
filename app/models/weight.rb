class Weight < ActiveRecord::Base
  belongs_to :food

  def as_json(options={})
    super(:only => [:id, :description])
  end
end
