class Resort < ApplicationRecord
  has_many :runs

  def average_run_length
    self.runs.average(:vertical_feet).to_f
  end

  def self.order_by_created_time
    order(created_at: :desc)
  end

end
