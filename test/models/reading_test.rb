require 'test_helper'

class ReadingTest < ActiveSupport::TestCase
  setup do
  end

  test "loads data" do
    response = stub(body: file_fixture('37618.json').read)
    RestClient.expects(:get).returns(response)
    
    reading = Reading.for(Location.find_or_create_by( zipcode: '37618' ))
  end
end
