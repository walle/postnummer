module Postnummer

  # Class that do the parsing from posten.se
  class Parser

    # @param [String] zip_code a swedish zip_code
    def initialize(zip_code)
      @zip_code = zip_code
    end

    # Makes the web call and parses out a list of Streets
    # @return [Array<Street>] a list of Street objects. Returns empty array if no streets found
    def parse
      url = "http://www.posten.se/soktjanst/postnummersok/resultat.jspv?pnr=#{@zip_code}"
      agent = Mechanize.new

      streets = []

      agent.get url do |page|
        rows = page.search 'table.result tr'
        rows.each do |tr|
          name = tr.search('td[1]').text
          street_numbers_string = tr.search('td[2]').text
          zip_code = tr.search('td[3]').text
          city = tr.search('td[4]').text

          street_numbers = parse_street_numbers(street_numbers_string)
          streets << Street.new(name, street_numbers[:first], street_numbers[:last], zip_code, city)
        end
      end

      streets
    end

    # Parses the street numbers from a street_numbers string
    # @params street_numbers [String] a string with the format '1 - 4'
    # @return [Hash] hash that has the start and end values. Use key :first and :last to access
    def parse_street_numbers(street_numbers)
      numbers = street_numbers.split ' - '
      { first: numbers[0], last: numbers[1] }
    end
  end
end
