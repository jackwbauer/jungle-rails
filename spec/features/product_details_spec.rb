require 'rails_helper'

RSpec.feature "Visitor navigates to product page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario 'they can naviagte to the product page by clicking on a product' do
    visit root_path

    expect(page).to have_css 'article.product'

    within first 'article.product' do
      find('img').click
    end

    expect(page).to have_css 'section.products-show'

    save_screenshot 'product_page.png'
  end
end
