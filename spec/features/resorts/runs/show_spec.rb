require 'rails_helper'

RSpec.describe 'Resort runs show' do
  before :each do
    @telluride = Resort.create!(name: "Telluride", location: "Colorado", is_open: true,  base_elevation: 8725, summit_elevation: 13150)
    @breck = Resort.create!(name: "Breckenridge", location: "The Moon", is_open: false,  base_elevation: 123, summit_elevation: 456)
    @spiral = @telluride.runs.create!(name: "Spiral Stairs", is_open: true, has_moguls: true, above_timberline: true, difficulty: "Double Black", vertical_feet: 2125)
    @bushwhack = @telluride.runs.create!(name: "Bushwhacker", is_open: true, has_moguls: true, above_timberline: true, difficulty: "Black", vertical_feet: 1326)
    @see = @breck.runs.create!(name: "See Forever", is_open: true, has_moguls: false, above_timberline: false, difficulty: "Blue", vertical_feet: 2643)
  end

  it "shows all the runs at this resort" do
    visit "resorts/#{@telluride.id}/runs"

    expect(page).to have_content("Bushwhacker")
    expect(page).to have_content("Double Black")

    expect(page).to_not have_content("See Forever")
    expect(page).to_not have_content("Blue")
  end

end
