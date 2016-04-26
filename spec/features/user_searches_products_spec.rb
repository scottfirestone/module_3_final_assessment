require "rails_helper"

RSpec.feature "User searches products" do
  scenario "they see exactly 15 results with sku, name, cust avg review, desc, sale price, and img" do
    VCR.use_cassette "best_buy_product_search" do
      visit "/"

      fill_in "q", with: "sennheiser"
      click_on "search"

      expect(current_path).to have_content("/search")

      results = []
      results = find(".products").all("ul")

      expect(results.count).to eq(15)
      results.each do |result|
        expect(result).to have_content("Sku")
        expect(result).to have_content("Name")
        expect(result).to have_content("Description")
        expect(result).to have_content("Sale Price")
      end
    end
  end
end
