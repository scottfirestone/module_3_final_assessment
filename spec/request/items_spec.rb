require "rails_helper"

RSpec.describe "Items", type: :request do
  it "returns all the items" do
    get "/api/v1/items"

    expect(response.status).to eq(200)
    expected_keys = [:name, :description, :image_url]
    binding.pry
  end
end
