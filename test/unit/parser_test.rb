require 'test_helper'

class ParserTest < Test::Unit::TestCase
  context 'parser' do
    setup do
      @parser = Postnummer::Parser.new('12345')
    end

    should 'be able to parse street numbers' do
      numbers = @parser.parse_street_numbers('1 - 12')
      assert_equal '1', numbers[:first]
      assert_equal '12', numbers[:last]
    end

    should 'be able to parse valid page' do
      stream = File.read('test/fixtures/valid.html')
      FakeWeb.register_uri(:get, 'http://www.posten.se/soktjanst/postnummersok/resultat.jspv?pnr=12345', body: stream, content_type: 'text/html')
      assert_equal 26, @parser.parse.count
    end

    should 'not give any on invalid page' do
      stream = File.read('test/fixtures/invalid.html')
      FakeWeb.register_uri(:get, 'http://www.posten.se/soktjanst/postnummersok/resultat.jspv?pnr=12345', body: stream, content_type: 'text/html')
      assert_equal 0, @parser.parse.count
    end
  end
end


