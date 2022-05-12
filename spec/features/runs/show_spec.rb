require 'rails_helper'

RSpec.describe 'the runs show page' do
  it "shows run name" do
    resort = Resort.create!(name: "Breckenridge", location: "Colorado", is_open: true, base_elevation: 9600, summit_elevation: 12998 )
    run = resort.runs.create!(name: "Powerline", is_open: true, has_moguls: false, above_timberline: false, difficulty: "Easy", vertical_feet: 711)
    visit "runs/#{run.id}"
    run1 = resort.runs.create!(name: "Silberhorne", is_open: true, has_moguls: false, above_timberline: false, difficulty: "Easy", vertical_feet: 632)

    visit "runs/#{run.id}"

    expect(page).to have_content(run.name)
    expect(page).to_not have_content(run1.name)

  end

  it "displays the resort name" do
    resort = Resort.create!(name: "Breckenridge", location: "Colorado", is_open: true, base_elevation: 9600, summit_elevation: 12998 )
    run = resort.runs.create!(name: "Powerline", is_open: true, has_moguls: false, above_timberline: false, difficulty: "Easy", vertical_feet: 711)
    visit "runs/#{run.id}"
    run1 = resort.runs.create!(name: "Silberhorne", is_open: true, has_moguls: false, above_timberline: false, difficulty: "Easy", vertical_feet: 632)

    visit "runs/#{run.id}"

    expect(page).to have_content(resort.name)
  end
end
