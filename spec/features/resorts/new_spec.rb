require 'rails_helper'

RSpes.describe 'new resort page' do
  it "can create a new resort" do
    visit '/resorts/new'

    fill_in 'resort[name]', with: "Test Resort"
    fill_in 'resort[location]', with: "Test Location"
    fill_in 'resort[is_open]', with: true
    fill_in 'resort[base_elevation]', with: 1234
    fill_in 'resort[summit_elevation]', with: 2345

    click_button 'Create Resort'

    expect(page).to have_content("Test Resort")
    expect(page).to have_content("Test Location")
    expect(page).to have_content("Base Elevation: 1234")
    expect(page).to have_content("Summit Elevation: 2345")
  end
end
