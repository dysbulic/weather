require 'test_helper'

class ReadingTest < ActiveSupport::TestCase
  setup do
    @location = Location.find_or_create_by( zipcode: '37618' )
  end

  test "loads valid data" do
    response = stub(body: file_fixture('37618.json').read)
    RestClient.expects(:get).returns(response)
    
    assert_difference('Reading.count') do
      reading = Reading.for(@location)
    end
  end

  test "fails on empty data" do
    response = stub(body: '{}')
    RestClient.expects(:get).returns(response)
    
    assert_raises ArgumentError do
      Reading.for(@location)
    end
  end

  test "fails on 404" do
    RestClient.expects(:get).raises(RestClient::NotFound)
    
    assert_raises RestClient::NotFound do
      Reading.for(@location)
    end
  end

  test "suceeds" do
    r = Reading.for(@location)
  end
end
