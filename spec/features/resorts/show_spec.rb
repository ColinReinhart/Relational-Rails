require 'rails_helper'

RSpec.describe 'Resort runs index' do
  before :each do
    @telluride = Resort.create!(name: "Telluride", location: "Colorado", is_open: true,  base_elevation: 8725, summit_elevation: 13150)
    @spiral = @telluride.runs.create!(name: "Spiral Stairs", is_open: true, has_moguls: true, above_timberline: true, difficulty: "Double Black", vertical_feet: 2125)
    @bushwhack = @telluride.runs.create!(name: "Bushwhacker", is_open: true, has_moguls: true, above_timberline: true, difficulty: "Black", vertical_feet: 1326)
    @see = @telluride.runs.create!(name: "See Forever", is_open: true, has_moguls: false, above_timberline: false, difficulty: "Blue", vertical_feet: 2643)
  end

  it "shows the resort and all attributes" do

    visit "/resorts/#{@telluride.id}"

    expect(page).to have_content(@telluride.name)
    expect(page).to have_content(@telluride.location)
    expect(page).to have_content(@telluride.is_open)
    expect(page).to have_content(@telluride.base_elevation)
    expect(page).to have_content(@telluride.summit_elevation)
  end

  it "shows the created_at" do
    visit '/resorts'
    expect(page).to have_content(@telluride.created_at)
  end
end
