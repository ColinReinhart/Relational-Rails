require 'rails_helper'

RSpec.describe 'Resort runs index' do
  before :each do
    @telluride = Resort.create!(name: "Telluride", location: "Colorado", is_open: true,  base_elevation: 8725, summit_elevation: 13150)
    @spiral = @telluride.runs.create!(name: "Spiral Stairs", is_open: true, has_moguls: true, above_timberline: true, difficulty: "Double Black", vertical_feet: 2125)
    @bushwhack = @telluride.runs.create!(name: "Bushwhacker", is_open: true, has_moguls: true, above_timberline: true, difficulty: "Black", vertical_feet: 1326)
    @see = @telluride.runs.create!(name: "See Forever", is_open: true, has_moguls: false, above_timberline: false, difficulty: "Blue", vertical_feet: 2643)
  end
  it "shows all the runs at the resort" do


    visit "/resorts/#{@telluride.id}/runs"

    expect(page).to have_content(@spiral.name)
    expect(page).to have_content(@bushwhack.name)
  end

  it "links to the runs show page" do
    visit "/resorts/#{@telluride.id}/runs"

    click_on @spiral.name

    expect(current_path).to eq("/runs/#{@spiral.id}")
  end

  it "shows the average vertical feet of the runs " do
    visit "/resorts/#{@telluride.id}/runs"

    expect(page).to have_content("Average run vertical feet at Telluride: 2031.33")
  end

  # User Story 8, Child Index Link
  #
  # As a visitor
  # When I visit any page on the site
  # Then I see a link at the top of the page that takes me to the Child Index
  it "has link to Runs Index" do
    visit "/resorts/#{@telluride.id}/runs"

    expect(page).to have_link('All Runs', href: '/runs')
    click_link('All Runs')
    expect(current_path).to eq('/runs')
  end
# User Story 9, Parent Index Link
#
# As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Parent Index
  it "has link to Resorts Index" do
    visit "/resorts/#{@telluride.id}/runs"

    expect(page).to have_link('All Resorts', href: '/resorts')
    click_link('All Resorts')
    expect(current_path).to eq('/resorts')
  end

    it "has a link to create a new run" do
      visit "resorts/#{@telluride.id}/runs"

      expect(page).to have_link("Create Run", href: "/resorts/#{@telluride.id}/runs/new")
    end
end
