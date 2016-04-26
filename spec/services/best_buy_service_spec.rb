require "rails_helper"

RSpec.describe "Best buy service", type: :request do
  it "returns a list of products from a search" do
    VCR.use_cassette "best_buy_product_search" do
      service = BestBuyService.new
      response = service.product_search("sennheiser")

      expect(response).to be(:success)


    end
  end
end
