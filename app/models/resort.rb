class Resort < ApplicationRecord
  has_many :runs

  def average_run_length
    # binding.pry
    self.runs.average(:vertical_feet).to_f
  end
end
