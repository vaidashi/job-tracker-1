require 'rails_helper'

describe "User edits an existing category" do
  scenario "from existing category list" do
    category = Category.create(title: "AR/VR")
    expect(category.title).to eq("AR/VR")

    visit categories_path
    click_on("Edit")

    fill_in('category[title]', with: "Genius")
    click_button "Update"

    expect(page).to have_content("Genius")
    expect(page).to_not have_content("AR/VR")
  end
end
