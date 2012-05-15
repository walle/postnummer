class Street
  attr_reader :name, :start, :end, :zip_code, :city

  def initialize(name, street_numbers, zip_code, city)
    street_numbers_hash = parse_street_numbers street_numbers
    @name = name
    @start = street_numbers_hash[:start]
    @end = street_numbers_hash[:end]
    @zip_code = zip_code
    @city = city
  end

  # Parses the street numbers from a street_numbers string
  # @params street_numbers [String] a string with the format '1 - 4'
  # @return [Hash] hash that has the start and end values. Use key :start, :end to access
  def parse_street_numbers(street_numbers)
    numbers = street_numbers.split ' - '
    { start: numbers[0], end: numbers[1]}
  end
end
