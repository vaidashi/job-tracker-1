require 'rails_helper'

describe "User can view all jobs" do
  scenario "that fall under a specific category" do
    company      = Company.create!(name: "HBO")
    category_1   = Category.create!(title: "Production")
    category_2   = Category.create!(title: "Business Development")
    company.jobs.create!(title: "Assistant Producer", level_of_interest: 67,
                          city: "New York", category_id: category_1.id)
    company.jobs.create!(title: "VP of Strategy", level_of_interest: 88,
                          city: "London", category_id: category_2.id)

    visit category_path(category_1)

    expect(page).to have_content("Assistant Producer")
    expect(page).to_not have_content("VP of Strategy")
  end
end
