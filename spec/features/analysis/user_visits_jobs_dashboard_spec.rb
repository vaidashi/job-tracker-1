require 'rails_helper'

describe "User visits jobs dashboard page" do
  scenario "sees count of jobs per level_of_interest" do
    job_1 = create(:job)
    job_2 = create(:job)
    job_3 = create(:job)

    visit 'dashboard'

    expect(page).to have_content("Level of Interest")
    expect(page).to have_content("Job Count")
    expect(page).to have_content(job_1.level_of_interest)
    expect(page).to have_content(job_2.level_of_interest)
    expect(page).to have_content(job_3.level_of_interest)
  end

  scenario "sees count of jobs per location" do
    job_1 = create(:job)
    job_2 = create(:job, city: "Las Vegas")
    job_3 = create(:job, city: "Charleston")

    visit 'dashboard'

    expect(page).to have_content("Job count by City")
    expect(page).to have_content("Denver")
    expect(page).to have_content("Las Vegas")
    expect(page).to have_content("Charleston")
  end

  scenario "user can click a location link and see a list of jobs located there" do
    job_1 = create(:job)
    job_2 = create(:job)
    job_3 = create(:job, city: "Austin")

    visit 'dashboard'

    click_on "Denver"

    expect(page).to have_content(job_1.title)
    expect(page).to have_content(job_2.title)
    expect(page).to_not have_content(job_3.title)
  end
end
