require "rails_helper"

RSpec.feature "User searches products" do
  scenario "they see exactly 15 results with sku, name, cust avg review, desc, sale price, and img" do
    visit "/"

    fill_in "q", with: "sennheiser"
    click_on "search"

    expect(current_path).to have_content("/search")

    results = []
    results = find(".product").("li").all
  end
end
