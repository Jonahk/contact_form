require 'spec_helper'

feature 'Create contact inquiry' do

  # As a site visitor
  # I want to contact the site's staff
  # So that I can tell them how awesome they are

  # Acceptance Criteria:

  # I must specify a valid email address
  # I must specify a subject
  # I must specify a description
  # I must specify a first name
  # I must specify a last name

  it 'creates a valid contact inquiry' do
    visit '/contacts/new'

    fill_in 'Email', with: 'jkaufman@gmail.com'
    fill_in 'Subject', with: 'cool stuff'
    fill_in 'Description', with: 'This stuff is cool'
    fill_in 'First name', with: 'Jonah'
    fill_in 'Last name', with: 'Kaufman'

    click_on 'Create Contact'
    expect(page).to have_content 'Contact was successfully created!'
  end

  it 'requires all fields to be completed' do
    visit '/contacts/new'
    click_on 'Create Contact'

    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Subject can't be blank"
    expect(page).to have_content "Description can't be blank"
    expect(page).to have_content "First name can't be blank"
    expect(page).to have_content "Last name can't be blank"
  end

end
