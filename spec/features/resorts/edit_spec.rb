require 'rails_helper'

RSpec.describe 'edit resort' do
  let!(:ski_resort) { Resort.create!(name:"Resort", location:"Resort", is_open:false, base_elevation:1, summit_elevation:2) }

  it "can update resort attributes" do
    visit "/resorts/#{ski_resort.id}/edit"

    fill_in 'resort[name]', with: "Test Resort"
    fill_in 'resort[location]', with: "Test Location"
    fill_in 'resort[is_open]', with: "true"
    fill_in 'resort[base_elevation]', with: "1224"
    fill_in 'resort[summit_elevation]', with: "4557"

    click_button 'Update Resort'
    expect(current_path).to eq("/resorts/#{@ski_resort.id}")

    expect(page).to have_content("Test Resort")
    expect(page).to have_content("Test Location")
    expect(page).to have_content(true)
    expect(page).to have_content(1224)
    expect(page).to have_content(4557)

    expect(page).to_not have_content("Control Name")
    expect(page).to_not have_content("Control Location")
    expect(page).to_not have_content(false)
    expect(page).to_not have_content(1224)
    expect(page).to_not have_content(4556)
  end
end
