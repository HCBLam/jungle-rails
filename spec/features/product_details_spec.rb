require 'rails_helper'

RSpec.feature "Visitor navigates from home page to product detail page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see product details page" do
    # ACT
    visit root_path
    expect(page).to have_css 'article.product', count: 10

    click_on('Details', match: :first)

    # DEBUG / VERIFY
    expect(page).to have_css 'article.product-detail'
    puts page.html
    save_screenshot
  end

end
