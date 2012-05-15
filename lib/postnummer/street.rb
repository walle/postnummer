module Postnummer

  # Contains street data
  class Street
    attr_reader :name, :first_number, :last_number, :zip_code, :city

    # @param [String] name the name of the street
    # @param [String] first_number the first number on the street
    # @param [String] last_number the last number on the street
    # @param [String] zip_code the zip_code
    # @param [String] city the city
    def initialize(name, first_number, last_number, zip_code, city)
      @name = name
      @first_number = first_number
      @last_number = last_number
      @zip_code = zip_code
      @city = city
    end
  end
end
