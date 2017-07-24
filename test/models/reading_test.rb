require 'test_helper'

class ReadingTest < ActiveSupport::TestCase
  setup do
  end

  test "loads data" do
    reading = Reading.for(Location.find_or_create_by( zipcode: '37618' ))
  end
end
