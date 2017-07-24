class Reading < ApplicationRecord
  belongs_to :location

  def self.for(location)
    response = RestClient.get Rails.application.secrets.weather_uri,
                              { params: { q: location.to_s,
                                          appid: Rails.application.secrets.app_key,
                                          units: :imperial } }

    res = JSON.parse(response.body, { symbolize_names: true })

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

    vals_map = key_map.map do |key, res_key|
      [key, res.dig(*res_key)]
    end

    vals = Hash[vals_map]

    raise ArgumentError, 'No values returned' if vals.values.compact.empty?
    
    [:time, :sunrise, :sunset].each do |date_key|
      vals[date_key] &&= Time.at(vals[date_key])
    end

    vals[:location] = location

    Reading.create(vals)
  end
end
