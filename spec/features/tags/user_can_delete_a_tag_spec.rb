require 'rails_helper'

describe "User can delete a tag" do
  scenario "from tags index" do
    tag_1 = Tag.create(title: "Initial Follow up")
    tag_2 = create(:tag)
    expect(Tag.count).to eq(2)

    visit tags_path

    click_on("Delete", :match => :first)

    expect(page).to have_content(tag_2.title)
    expect(Tag.count).to eq(1)
  end
end
