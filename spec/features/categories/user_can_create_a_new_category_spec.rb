require 'rails_helper'

describe "User can create a new category" do
  scenario "if it doesn't already exist" do
    expect(Category.count).to eq(0)

    visit new_category_path

    fill_in "category[title]", with: "Engineering"

    click_button "Create"

    expect(current_path).to eq(category_path(Category.first))
    expect(Category.count).to eq(1)
    expect(page).to have_content("Engineering")
  end

  scenario "but can't if category already exists" do
    category  = Category.create(title: "Engineering")
    expect(Category.count).to eq(1)

    visit new_category_path

    fill_in "category[title]", with: "Engineering"

    click_button "Create"
    # expect(current_path).to eq(new_category_path)
    expect(Category.count).to eq(1)
  end
end
