class SearchController < ApplicationController
  def show
    @results = BestBuyProduct.all
  end
end
