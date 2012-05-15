if ENV["COVERAGE"]
  require 'simplecov'
  SimpleCov.start do
    add_filter "/test/"
  end
end

require 'test/unit'
require 'shoulda'
require 'fakeweb'

require 'postnummer'
