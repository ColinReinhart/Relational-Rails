require 'rails_helper'

RSpec.describe 'Runs runs index' do
  describe 'everything but 23' do
    before :each do
      @telluride = Resort.create!(name: "Telluride", location: "Colorado", is_open: true,  base_elevation: 8725, summit_elevation: 13150)
      @spiral = @telluride.runs.create!(name: "Spiral Stairs", is_open: true, has_moguls: true, above_timberline: true, difficulty: "Double Black", vertical_feet: 2125)
      @bushwhack = @telluride.runs.create!(name: "Bushwhacker", is_open: true, has_moguls: true, above_timberline: true, difficulty: "Black", vertical_feet: 1326)
      @see = @telluride.runs.create!(name: "See Forever", is_open: true, has_moguls: false, above_timberline: false, difficulty: "Blue", vertical_feet: 2643)
    end

    it "shows all the runs" do

      visit "/runs"

      expect(page).to have_content(@spiral.name)
      expect(page).to have_content(@bushwhack.name)
      expect(page).to have_content(@see.name)
    end

    it "has link to Runs Index" do
      visit "/runs"

      expect(page).to have_link('All Runs', href: '/runs')
      click_link('All Runs')
      expect(current_path).to eq('/runs')
    end

    it "has link to Resorts Index" do
      visit "/runs"

      expect(page).to have_link('All Resorts', href: '/resorts')
      click_link('All Resorts')
      expect(current_path).to eq('/resorts')
    end

    it "has link to edit each run" do
      visit "/runs"
      expect(page).to have_link("Update Run", href: "/runs/#{@spiral.id}/edit")
    end
  end

  describe "User Story 23" do

    it "has link to delete run" do
      telluride = Resort.create!(name: "Telluride", location: "Colorado", is_open: true,  base_elevation: 8725, summit_elevation: 13150)
      spiral = telluride.runs.create!(name: "Spiral Stairs", is_open: true, has_moguls: true, above_timberline: true, difficulty: "Double Black", vertical_feet: 2125)
      visit "/runs"
      expect(page).to have_link("Delete Run")

      click_link("Delete Run")

      expect(page).to_not have_content("Spiral Stairs")
    end
  end

end
