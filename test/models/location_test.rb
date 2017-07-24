require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  setup do
    @location = Location.find_or_create_by( zipcode: '37618' )
  end

  test 'returns the most recent' do
    response = stub(body: file_fixture('37618.json').read)
    RestClient.expects(:get).returns(response)
    
    assert_difference('Reading.count') do
      @location.current_reading
    end
  end

  test 'can update everything' do
    response = stub(body: file_fixture('37618.json').read)
    RestClient.expects(:get).returns(response).times(Location.count)
    
    assert_difference('Reading.count', Location.count) do
      Location.update_all
    end
  end
end
