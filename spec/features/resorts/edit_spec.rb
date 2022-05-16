require 'rails_helper'

RSpec.describe 'edit resort' do
  before :each do
    @telluride = Resort.create!(name: "Telluride", location: "Colorado", is_open: true,  base_elevation: 8725, summit_elevation: 13150)
    @spiral = @telluride.runs.create!(name: "Spiral Stairs", is_open: true, has_moguls: true, above_timberline: true, difficulty: "Double Black", vertical_feet: 2125)
    @bushwhack = @telluride.runs.create!(name: "Bushwhacker", is_open: true, has_moguls: true, above_timberline: true, difficulty: "Black", vertical_feet: 1326)
    @see = @telluride.runs.create!(name: "See Forever", is_open: true, has_moguls: false, above_timberline: false, difficulty: "Blue", vertical_feet: 2643)
  end

  it "can edit resort attributes" do
    visit "/resorts/#{@telluride.id}/edit"

    fill_in 'resort[name]', with: "Test"
    fill_in 'resort[location]', with: "Test"
    fill_in 'resort[is_open]', with: "false"
    fill_in 'resort[base_elevation]', with: "1224"
    fill_in 'resort[summit_elevation]', with: "4557"

    click_button 'Update'
    expect(current_path).to eq("/resorts/#{@telluride.id}")

    expect(page).to have_content("Test")
    expect(page).to have_content("Test")
    expect(page).to have_content(false)
    expect(page).to have_content(1224)
    expect(page).to have_content(4557)

    expect(page).to_not have_content("Telluride")
    expect(page).to_not have_content("Colorado")
    expect(page).to_not have_content(true)
    expect(page).to_not have_content(1224)
    expect(page).to_not have_content(4556)
  end
end
