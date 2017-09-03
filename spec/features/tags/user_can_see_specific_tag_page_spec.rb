require 'rails_helper'

describe "User can visit specific tag page" do
  scenario "and sees all jobs that have that tag" do
    job = create(:job)
    tag_1 = create(:tag)
    tag_2 = create(:tag)
    job.tags.create(title: "Looks like a winner")

    visit tag_path(Tag.last)

    expect(page).to have_content(job.title)

    visit tag_path(tag_1)
    expect(page).to_not have_content(job.title)
  end
end
