require 'rails_helper'

RSpec.describe 'Resort runs index' do
  before :each do
    @telluride = Resort.create!(name: "Telluride", location: "Colorado", is_open: true,  base_elevation: 8725, summit_elevation: 13150)
    @spiral = @telluride.runs.create!(name: "Spiral Stairs", is_open: true, has_moguls: true, above_timberline: true, difficulty: "Double Black", vertical_feet: 2125)
    @bushwhack = @telluride.runs.create!(name: "Bushwhacker", is_open: true, has_moguls: true, above_timberline: true, difficulty: "Black", vertical_feet: 1326)
    @see = @telluride.runs.create!(name: "See Forever", is_open: true, has_moguls: false, above_timberline: false, difficulty: "Blue", vertical_feet: 2643)
  end

  it "shows all the resorts" do

    visit "/resorts"

    expect(page).to have_content(@telluride.name)
  end

  it "shows the resorts in by most recently created" do
    breck = Resort.create!(name: "Breckenridge", location: "Colorado", is_open: true, base_elevation: 9600, summit_elevation: 12998)

    visit "/resorts"

    expect("Breckenridge").to appear_before("Telluride")

    whistler = Resort.create!(name: "Whistler", location: "British Colombia", is_open: true, base_elevation: 2182, summit_elevation: 7160)

    visit "/resorts"

    expect("Whistler").to appear_before("Breckenridge")
  end

  it "has link to Runs Index" do
    visit "/resorts"

    expect(page).to have_link('All Runs', href: '/runs')
    click_link('All Runs')
    expect(current_path).to eq('/runs')
  end

  it "has link to Resorts Index" do
    visit "/resorts"

    expect(page).to have_link('All Resorts', href: '/resorts')
    click_link('All Resorts')
    expect(current_path).to eq('/resorts')
  end
end
