class Run < ApplicationRecord
  belongs_to :resort

  def self.is_open
    where(is_open: true)
  end

  def self.site_order(sort_order)
    # binding.pry
    if sort_order = "Alphabetical"
      Run.order(:name)
    else
      Run.all
    end
  end
end
