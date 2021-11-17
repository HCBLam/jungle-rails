require 'rails_helper'

RSpec.feature "Visitor can click the 'Add to Cart' button", type: :feature, js: true do

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

  scenario "The cart count will increase by one" do
    # ACT
    visit root_path
    expect(page).to have_text 'My Cart (0)', count: 1

    click_on('Add', match: :first)

    # DEBUG / VERIFY
    expect(page).to have_text 'My Cart (1)', count: 1
    save_screenshot
  end

end

