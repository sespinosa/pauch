class Financing < ActiveRecord::Base
  
  def to_label
    name
  end
  
end
