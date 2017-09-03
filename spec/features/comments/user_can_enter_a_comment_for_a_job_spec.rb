require 'rails_helper'

describe "User can enter a comment for a job" do
  scenario "on job show page" do
    job = create(:job)
    expect(Comment.count).to eq(0)

    visit company_job_path(job.company, job)

    fill_in "comment[notes]", with: "Looks like a great job!"
    click_on("Create")
    # binding.pry
    expect(Comment.count).to eq(1)
    expect(current_path).to eq(company_job_path(job.company, job))
    expect(page).to have_content("Looks like a great job!")
  end
end
