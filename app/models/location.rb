class Location < ApplicationRecord
  def to_s
    zipcode || name
  end
end
