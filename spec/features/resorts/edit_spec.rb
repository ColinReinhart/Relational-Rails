require 'rails_helper'

RSpec.describe 'edit resort' do

  it "can edit resort attributes" do
    resort = Resort.create!(name: "Telluride", location: "Colorado", is_open: true,  base_elevation: 8725, summit_elevation: 13150)

    visit "/resorts/#{resort.id}/edit"

    fill_in 'name', with: "Test"
    fill_in 'location', with: "Test"
    fill_in 'is_open', with: "false"
    fill_in 'base_elevation', with: "1224"
    fill_in 'summit_elevation', with: "4557"

    click_button 'Update'
    expect(current_path).to eq("/resorts/#{resort.id}")

    expect(page).to have_content("Test")
    expect(page).to have_content("Test")
    expect(page).to have_content(false)
    expect(page).to have_content(1224)
    expect(page).to have_content(4557)

    expect(page).to_not have_content("Telluride")
    expect(page).to_not have_content("Colorado")
    expect(page).to_not have_content(true)
    expect(page).to_not have_content(8725)
    expect(page).to_not have_content(13150)
  end
end
