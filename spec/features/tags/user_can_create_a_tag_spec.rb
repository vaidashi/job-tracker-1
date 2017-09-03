require 'rails_helper'

describe "User creates a new tag" do
  scenario "from a form on the site" do
    expect(Tag.count).to eq(0)

    visit new_tag_path

    fill_in "tag[title]", with: "interview scheduled"
    click_button "Create"

    expect(current_path).to eq tags_path
    expect(page).to have_content("interview scheduled")
    expect(Tag.count).to eq(1)
  end
end
