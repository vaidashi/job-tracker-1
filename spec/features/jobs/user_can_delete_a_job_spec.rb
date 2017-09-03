require 'rails_helper'

describe "User can delete a job" do
  scenario "for a specific company" do
    job1, job2 = create_list(:job, 2)

    visit company_jobs_path(job1.company)
    expect(page).to have_content(job1.title)
    expect(Job.count).to eq(2)

    click_on("Delete")

    expect(current_path).to eq(company_jobs_path(job1.company))
    expect(page).to_not have_content(job1.title)
    expect(Job.count).to eq(1)
  end
end
