require 'rails_helper'

describe "User can view all categories" do
  scenario "from categories index page" do
    category = create_list(:category, 3)

    visit categories_path

    expect(page).to have_content(category.first.title)
    expect(page).to have_content(category.second.title)
    expect(page).to have_content(category.third.title)
  end
end
