require 'test_helper'

class ReadingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reading = readings(:one)
  end

  test "should get index" do
    get readings_url
    assert_response :success
  end

  test "should get new" do
    get new_reading_url
    assert_response :success
  end

  test "should create reading" do
    assert_difference('Reading.count') do
      post readings_url, params: { reading: { cloudiness: @reading.cloudiness, conditions: @reading.conditions, humidity: @reading.humidity, location_id: @reading.location_id, pressure: @reading.pressure, sunrise: @reading.sunrise, sunset: @reading.sunset, temperature: @reading.temperature, time: @reading.time, wind_speed: @reading.wind_speed, wind_direction: @reading.wind_direction } }
    end

    assert_redirected_to reading_url(Reading.last)
  end

  test "should show reading" do
    get reading_url(@reading)
    assert_response :success
  end

  test "should get edit" do
    get edit_reading_url(@reading)
    assert_response :success
  end

  test "should update reading" do
    patch reading_url(@reading), params: { reading: { cloudiness: @reading.cloudiness, conditions: @reading.conditions, humidity: @reading.humidity, location_id: @reading.location_id, pressure: @reading.pressure, sunrise: @reading.sunrise, sunset: @reading.sunset, temperature: @reading.temperature, time: @reading.time, wind_speed: @reading.wind_speed, wind_direction: @reading.wind_direction } }
    assert_redirected_to reading_url(@reading)
  end

  test "should destroy reading" do
    assert_difference('Reading.count', -1) do
      delete reading_url(@reading)
    end

    assert_redirected_to readings_url
  end
end
