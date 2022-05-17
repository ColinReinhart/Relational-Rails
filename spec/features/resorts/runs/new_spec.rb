require 'rails_helper'

RSpec.describe 'new run page' do
  before :each do
    @telluride = Resort.create!(name: "Telluride", location: "Colorado", is_open: false,  base_elevation: 8725, summit_elevation: 13150)
  end

  it "can create a new run" do

    visit "/resorts/#{@telluride.id}/runs/new"

    fill_in 'name', with: "Test Run"
    fill_in 'difficulty', with: "Blue"
    fill_in 'is_open', with: true
    fill_in 'has_moguls', with: false
    fill_in 'above_timberline', with: false

    click_button 'Create Run'
    expect(current_path).to eq("/resorts/#{@telluride.id}/runs")

    test = Run.last
    expect(test.name).to eq("Test Run")
    expect(test.difficulty).to eq("Blue")
    expect(test.is_open).to eq(true)
    expect(test.has_moguls).to eq(false)
    expect(test.above_timberline).to eq(false)
  end
end
