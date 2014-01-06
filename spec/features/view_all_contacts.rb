require 'spec_helper'

feature 'View all contacts' do

  # As an admin
  # I want to review contact inquiries
  # So that I can respond or take action

  # Acceptance Criteria:

  # I can see a list of all contact inquiries

  it 'displays all contacts' do
    contact1 = FactoryGirl.create(:contact)
    contact2 = FactoryGirl.create(:contact, subject: 'please work')
    contact3 = FactoryGirl.create(:contact, description: 'i hope this works')

    visit '/contacts'
    expect(page).to have_content 'a cool subject'
    expect(page).to have_content 'please work'
    expect(page).to have_content 'i hope this works'
  end
end
