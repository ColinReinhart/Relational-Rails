require 'rails_helper'

RSpec.describe 'edit run' do

  it "can edit run attributes" do
    telluride = Resort.create!(name: "Telluride", location: "Colorado", is_open: true,  base_elevation: 8725, summit_elevation: 13150)
    run = telluride.runs.create!(name: "Control", is_open: true,  has_moguls: true, above_timberline: true, difficulty: "Control", vertical_feet: 1)

    visit "/runs/#{run.id}/edit"

    fill_in 'name', with: "Test"
    fill_in 'is_open', with: "false"
    fill_in 'has_moguls', with: "false"
    fill_in 'above_timberline', with: "false"
    fill_in 'difficulty', with: "Test"
    fill_in 'vertical_feet', with: 2

    click_button 'Update Run'
    expect(current_path).to eq("/runs/#{run.id}")

    expect(page).to have_content("Test")
    expect(page).to have_content(false)
    expect(page).to have_content(2)

    expect(page).to_not have_content("Control")
    expect(page).to_not have_content(true)
    expect(page).to_not have_content(1)
  end
end
