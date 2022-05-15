require 'rails_helper'

RSpec.describe 'new resort page' do
  it "can create a new resort" do
    visit '/resorts/new'

    fill_in 'resort[name]', with: "Test Resort"
    fill_in 'resort[location]', with: "Test Location"
    fill_in 'resort[is_open]', with: true
    fill_in 'resort[base_elevation]', with: 1234
    fill_in 'resort[summit_elevation]', with: 2345

    click_button 'Create Resort'

    expect(page).to have_content("Test Resort")
    expect(current_path).to eq('/resorts')
    test = Resort.last
    expect(test.name).to eq("Test Resort")
    expect(test.location).to eq("Test Location")
    expect(test.is_open).to eq(true)
    expect(test.base_elevation).to eq(1234)
    expect(test.summit_elevation).to eq(2345)
  end
end
