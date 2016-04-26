class BestBuyProduct
  attr_reader :name,
              :sku,
              :sale_price,
              :short_description,
              :customer_review_average,
              :image

  def initialize(params)
    @name = params[:name]
    @sku = params[:sku] if params[:sku]
    @sale_price = params[:salePrice]
    @short_description = params[:shortDescription]
    @customer_review_average = params[:customerReviewAverage]
    @image = params[:thumbnailImage]
  end

  def self.find_all_by(q)
    BestBuyService.new.product_search(q)[:products].map { |raw_product|
      new(raw_product)
    }
  end
end
