require 'rails_helper'

describe "User can see existing contacts" do
  scenario "for a specific company" do
    company = create(:company)
    contact_1 = create(:contact, company_id: company.id)
    contact_2 = create(:contact, company_id: company.id)

    visit company_path(company)

    expect(page).to have_content(contact_1.full_name)
    expect(page).to have_content(contact_1.position)
    expect(page).to have_content(contact_1.email)
    expect(page).to have_content(contact_2.full_name)
    expect(page).to have_content(contact_2.position)
    expect(page).to have_content(contact_2.email)
  end
end
