class Location < ApplicationRecord
  def current_reading
    begin
      Reading.for self
    rescue ArgumentError => error
      logger.warn error.message
    rescue RestClient::Exception => error
      logger.warn error.message, error.code
    end
  end

  def self.update_all
    Location.all.map{ |l| l.current_reading }
  end

  def to_s
    zipcode || name
  end
end
