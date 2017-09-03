require 'rails_helper'

describe "User can edit a job" do
  scenario "for a specific company" do
    job = create(:job)

    visit company_jobs_path(job.company)
    expect(page).to have_content(job.title)
    click_on("Edit")

    fill_in('job[title]', with: "CSM")
    click_on("Update Job")

    expect(page).to have_content("CSM")
    expect(Job.count).to eq(1)
  end
end
