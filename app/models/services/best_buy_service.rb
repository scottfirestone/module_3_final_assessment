class BestBuyService
  def initialize
    @_api_key = ENV["BEST_BUY_API_KEY"]
    @_connection = Faraday.new("http://api.bestbuy.com/")
  end

  def product_search(params)
    connection.get("")
  end

  private

    def api_key
      @_api_key
    end

    def connection
      @_connection
    end

    def parse
      JSON.parse(response.body, symbolize_names: true)
    end
end
