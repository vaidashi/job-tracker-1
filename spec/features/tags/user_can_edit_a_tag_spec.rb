require 'rails_helper'

describe "User can edit a tag" do
  scenario "from tags index" do
    tag_1 = create(:tag)
    tag_2 = create(:tag)

    visit tags_path
    click_on("Edit", :match => :first)

    fill_in('tag[title]', with: "Second Inteview Scheduled")
    click_on("Update")

    expect(page).to have_content("Second Inteview Scheduled")
    expect(page).to have_content(tag_2.title)
  end
end
