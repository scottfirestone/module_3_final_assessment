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

  it "returns an item by id" do
    item = Item.create(
      name: "Item Name",
      description: "Description",
      image_url: "Image Url"
    )

    other_item = Item.create(
      name: "Dumb widget",
      description: "You shouldn't see this",
      image_url: "A lie"
    )

    get "/api/v1/items/#{item.id}.json"

    json = JSON.parse(response.body)
    expected_keys = ["name", "description", "image_url"]

    expect(response.status).to eq(200)
    expect(json["item"].keys).to eq(expected_keys)
    expect(json["item"]["description"]).to eq("Description")
    expect(json["item"]["description"]).to_not eq("You shouldn't see this")
  end
end
