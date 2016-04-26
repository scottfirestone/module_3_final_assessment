class SearchController < ApplicationController
  def show
    @products = BestBuyProduct.find_all_by(params[:q])
  end
end
