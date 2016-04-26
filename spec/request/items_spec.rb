require "rails_helper"

RSpec.describe "Items", type: :request do
  it "returns all the items" do
    items = 5.times do |i|
      Item.create(
        name: "Name #{i}",
        description: "Description #{i}",
        image_url: "Image Url #{i}"
      )
    end

    get "/api/v1/items.json"

    json = JSON.parse(response.body)
    expected_keys = ["name", "description", "image_url"]

    expect(response.status).to eq(200)
    expect(json["items"].count).to eq(5)
    expect(json["items"].first.keys).to eq(expected_keys)
  end
end
