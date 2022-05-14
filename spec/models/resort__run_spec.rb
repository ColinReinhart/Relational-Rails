require 'rails_helper'

RSpec.describe Resort do
  it {should have_many :runs}

  describe 'instance methods' do
    describe '#average_run_length' do
      before :each do
        @telluride = Resort.create!(name: "Telluride", location: "Colorado", is_open: true,  base_elevation: 8725, summit_elevation: 13150)
        @spiral = @telluride.runs.create!(name: "Spiral Stairs", is_open: true, has_moguls: true, above_timberline: true, difficulty: "Double Black", vertical_feet: 2125)
        @bushwhack = @telluride.runs.create!(name: "Bushwhacker", is_open: true, has_moguls: true, above_timberline: true, difficulty: "Black", vertical_feet: 1326)
        @see = @telluride.runs.create!(name: "See Forever", is_open: true, has_moguls: false, above_timberline: false, difficulty: "Blue", vertical_feet: 2643)
      end

      it 'returns the average run length' do
        expect(@telluride.average_run_length.round(2)).to eq(2031.33)
      end
    end
  end
end
