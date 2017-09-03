require 'rails_helper'

describe "User can delete an existing category" do
  scenario "from category index page" do
    category_1 = Category.create!(title: "Legal")
    category_2 = Category.create!(title: "Marketing")

    visit categories_path
    expect(Category.count).to eq(2)

    click_link("Delete", :match => :first)

    expect(page).to have_content("Marketing")
    expect(Category.count).to eq(1)
  end
end
