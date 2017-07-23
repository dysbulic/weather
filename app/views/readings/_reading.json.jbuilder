json.extract! reading, :id, :location_id, :conditions, :pressure, :temperature, :wind_speed, :wind_direction, :humidity, :time, :sunrise, :sunset, :cloudiness, :created_at, :updated_at
json.url reading_url(reading, format: :json)
