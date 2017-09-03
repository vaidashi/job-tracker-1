require 'rails_helper'

describe "User sees jobs" do
  scenario "filtered by city" do
    job_1 = create(:job)
    job_2 = create(:job)
    job_3 = create(:job, city: "Boise")
    job_4 = create(:job, city: "Butte")

    visit '/jobs?sort=Denver'

    expect(page).to have_content(job_1.title)
    expect(page).to have_content(job_2.title)
    expect(page).to_not have_content(job_3.title)
    expect(page).to_not have_content(job_4.title)
  end
end
