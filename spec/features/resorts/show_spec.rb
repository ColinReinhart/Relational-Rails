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
    visit "/resorts"
    expect(page).to have_content(@telluride.created_at)
  end

# As a visitor
# When I visit a parent's show page
# I see a count of the number of children associated with this parent

  it "shows the count of runs at a resort" do
    visit "/resorts/#{@telluride.id}"

    expect(page).to have_content("Number of runs at Telluride = 3")
  end

  it "has link to Runs Index" do
    visit "/resorts/#{@telluride.id}"

    expect(page).to have_link('All Runs', href: '/runs')
    click_link('All Runs')
    expect(current_path).to eq('/runs')
  end

  it "has link to Resorts Index" do
    visit "/resorts/#{@telluride.id}"

    expect(page).to have_link('All Resorts', href: '/resorts')
    click_link('All Resorts')
    expect(current_path).to eq('/resorts')
  end
# User Story 10, Parent Child Index Link
#
# As a visitor
# When I visit a parent show page ('/parents/:id')
# Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')
  it "has a link to take me to runs at resort page" do
    visit "/resorts/#{@telluride.id}"

    expect(page).to have_link('All Runs at Telluride', href: "/resorts/#{@telluride.id}/runs")
    click_link('All Runs at Telluride')
    expect(current_path).to eq("/resorts/#{@telluride.id}/runs")
  end

  it "has a link to Update Resort page" do
    visit "/resorts/#{@telluride.id}"
    
    expect(page).to have_link('Update Resort', href: "/resorts/#{@telluride.id}/edit")
    click_link('Update Resort')
    expect(current_path).to eq("/resorts/#{@telluride.id}/edit")
  end
end
