require 'test_helper'

SimpleCov.command_name 'test:units' if ENV["COVERAGE"]

class StreetTest < Test::Unit::TestCase
  context 'fulfill interface' do
    setup do
      @name = 'Foo'
      @first_number = '1'
      @last_number = '12'
      @zip_code = '123 45'
      @city = 'foobar'
      @street = Postnummer::Street.new(@name, @first_number, @last_number, @zip_code, @city)
    end

    should 'have correct values' do
      assert_equal @name, @street.name
      assert_equal @first_number, @street.first_number
      assert_equal @last_number, @street.last_number
      assert_equal @zip_code, @street.zip_code
      assert_equal @city, @street.city
    end
  end
end

