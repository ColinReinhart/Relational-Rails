require 'rails_helper'

RSpec.describe Run, type: :model do
  it {should belong_to :resort}
  before :each do
    @telluride = Resort.create!(name: "Telluride", location: "Colorado", is_open: true,  base_elevation: 8725, summit_elevation: 13150)
    @spiral = @telluride.runs.create!(name: "Spiral Stairs", is_open: true, has_moguls: true, above_timberline: true, difficulty: "Double Black", vertical_feet: 2125)
    @bush = @telluride.runs.create!(name: "Bushwhacker", is_open: true, has_moguls: true, above_timberline: true, difficulty: "Black", vertical_feet: 1326)
    @see = @telluride.runs.create!(name: "See Forever", is_open: false, has_moguls: false, above_timberline: false, difficulty: "Blue", vertical_feet: 2643)
  end

  it "can tell which runs are open" do
    expect(Run.is_open).to eq([@spiral, @bush])
  end

  it "sorts runs alphabetically by name" do
    visit "/resorts/#{@telluride.id}/runs"

    expext(@priral.name).to appear_before(@bush.name)

    click_link("Sort Alphabetically")

    expect(@bush.name).to appear_before(@see.name)
    expect(@see.name).to appear_before(@Spiral.name)
  end

end
