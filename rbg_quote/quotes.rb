# quotes.rb
# http://www.gummy-stuff.org/Yahoo-data.htm
require 'sinatra' # should be the first line
require 'open-uri'
require 'csv'

#class
class Stock
  def initialize(symbol)
    @symbol = symbol.upcase
    get_info
  end
  attr_reader :row0, :row1, :row2, :row3, :row4, :row5, :row6, :row7
  private
    def is_invalid(symbol)
      return symbol.match(/[\^\!@#\$&\*\(\)%\-_=\+ :]/)
    end

  private
    #Get info about specific stock
    def get_info
      if is_invalid(@symbol)
        # TODO: How to log an error?
	msg = "symbol '#{@symbol}' invalid, skipping"
	STDERR.puts msg
	@row0 = msg
	@row1 = 0.0
	@row2 = 'the web'
	@row3 = Time.now
	@row4 = 0.0
	@row5 = @row6 = @row7 = 'n/a'
	return
      end

      url = "http://download.finance.yahoo.com/d/quotes.csv?s=#{@symbol}&f=sl1d1t1c1ohgv&e=.csv"
      csv = CSV.parse(open(url).read)
      #parse csv data
      csv.each do |row|
        @row0 = row[0]
        @row1 = row[1]
        @row2 = row[2]
        @row3 = row[3]
        @row4 = row[4]
        @row5 = row[5]
        @row6 = row[6]
        @row7 = row[7]
      end
    end
end
 
# Get new Stock Symbol
get '/' do
  erb :new
end

# Display stock details
get '/show' do
  @stock = Stock.new(params[:symbol])
  erb :show
end

