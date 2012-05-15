require 'mechanize'

$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))
require 'street'

class Parser
  def initialize(zip_code)
    @zip_code = zip_code
  end

  # Makes the web call and parses out a list of Streets
  # @return [Array] a list of Street objects. Returns empty array if no streets found
  def parse
    url = "http://www.posten.se/soktjanst/postnummersok/resultat.jspv?pnr=#{@zip_code}"
    agent = Mechanize.new

    streets = []

    agent.get url do |page|
      rows = page.search 'table.result tr'
      rows.each do |tr|
        name = tr.search('td[1]').text
        street_numbers = tr.search('td[2]').text
        zip_code = tr.search('td[3]').text
        city = tr.search('td[4]').text

        streets << Street.new(name, street_numbers, zip_code, city)
      end
    end

    streets
  end
end
