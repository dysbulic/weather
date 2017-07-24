class Reading < ApplicationRecord
  belongs_to :location

  def self.for(location)
    response = RestClient.get 'http://api.openweathermap.org/data/2.5/weather',
                              { params: { q: location.to_s,
                                          appid: '3ea93adb81958b1ec5268b4d2f00a749',
                                          units: :imperial } }
    
    key_map = {
      conditions: [:weather, 0, :main],
      pressure: [:main, :pressure],
      temperature: [:main, :temp],
      humidity: [:main, :humidity],
      time: :dt,
      sunrise: [:sys, :sunrise],
      sunset: [:sys, :sunset],
      cloudiness: [:clouds, :all],
      wind_speed: [:wind, :speed],
      wind_direction: [:wind, :deg]
    }

    res = JSON.parse(response.body, { symbolize_names: true })

    vals_map = key_map.map do |key, res_key|
      [key, res.dig(*res_key)]
    end

    vals = Hash[vals_map]

    [:time, :sunrise, :sunset].each do |date_key|
      vals[date_key] = Time.at(vals[date_key])
    end

    vals[:location] = location

    Reading.create(vals)
  end
end
