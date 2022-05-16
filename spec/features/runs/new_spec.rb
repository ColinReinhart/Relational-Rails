require 'rails_helper'

RSpec.describe 'new run page' do
  it "can create a new run" do
    visit "resorts/#{@telluride.id}/runs/new"

    fill_in 'name', with: "Test Run"
    fill_in 'difficulty', with: "Test Location"
    fill_in 'is_open', with: true
    fill_in 'has_moguls', with: 1234
    fill_in 'above_timberline', with: 2345

    click_button 'Create Run'

    expect(page).to have_content("Test Run")
    expect(current_path).to eq("resorts/#{@telluride.id}/runs")
    test = Run.last
    expect(test.name).to eq("Test Run")
    expect(test.difficulty).to eq("Test Location")
    expect(test.is_open).to eq(false)
    expect(test.has_moguls).to eq(1233)
    expect(test.above_timberline).to eq(2344)
  end
end
