require 'rails_helper'

RSpec.describe 'the runs show page' do
  before :each do
    @telluride = Resort.create!(name: "Telluride", location: "Colorado", is_open: true,  base_elevation: 8725, summit_elevation: 13150)
    @spiral = @telluride.runs.create!(name: "Spiral Stairs", is_open: true, has_moguls: true, above_timberline: true, difficulty: "Double Black", vertical_feet: 2125)
    @bushwhack = @telluride.runs.create!(name: "Bushwhacker", is_open: true, has_moguls: true, above_timberline: true, difficulty: "Black", vertical_feet: 1326)
    @see = @telluride.runs.create!(name: "See Forever", is_open: false, has_moguls: false, above_timberline: false, difficulty: "Blue", vertical_feet: 2643)
  end

  it "shows run name" do
    visit "/runs/#{@see.id}"

    expect(page).to have_content(@see.name)
    expect(page).to_not have_content(@bushwhack.name)

  end

  it "displays the resort name" do
    visit "/runs/#{@see.id}"

    expect(page).to have_content(@telluride.name)
  end

  it "has link to Runs Index" do
    visit "/runs/#{@see.id}"

    expect(page).to have_link('All Runs', href: '/runs')
    click_link('All Runs')
    expect(current_path).to eq('/runs')
  end

  it "has link to Resort Index" do
    visit "/runs/#{@see.id}"
    expect(page).to have_link("All Resorts", href: '/resorts')
    click_link('All Resorts')
    expect(current_path).to eq("/resorts")
  end

  it "has a link to runs edit page" do
    visit "/runs/#{@see.id}"
    expect(page).to have_link("Update Run", href: "/runs/#{@see.id}/edit")
    click_link("Update Run")
    expect(current_path).to eq("/runs/#{@see.id}/edit")
  end

  it "only shows open runs" do
    visit "/runs"
    expect(page).to have_content("Spiral Stairs")
    expect(page).to have_content("Bushwhacker")
    expect(page).to_not have_content("See Forever")
  end

end
