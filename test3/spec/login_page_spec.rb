require_relative '../init'

RSpec.describe "login", type: :feature do
  before :each do
    
  end

  it "login" do
    visit 'https://cross-edit-staging-frontend.herokuapp.com/'
    within("#session") do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: '12345678'
    end
    click_button 'log in'
    expect(page).to have_content 'Success'
  end
end