class BestBuyService
  def initialize
    @_api_key = ENV["BEST_BUY_KEY"]
    @_connection = Faraday.new("http://api.bestbuy.com/v1/")
  end

  def product_search(query)
    response = connection.get do |req|
      req.url "products(search=#{query})?"
      req.params["show"] = "name,sku,salePrice,shortDescription,customerReviewAverage,thumbnailimage"
      req.params["format"] = "json"
      req.params["apiKey"] = "#{api_key}"
    end
    binding.pry
    parse(response)
  end

  private

    def api_key
      @_api_key
    end

    def connection
      @_connection
    end

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end
