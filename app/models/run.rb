class Run < ApplicationRecord
  belongs_to :resort

  def self.is_open
    where(is_open: true)
  end

  def self.site_order(order = nil, filter_param = nil)
    if order == "Alphabetical"
      Run.order(:name)
    elsif order == "Filter"
      Run.where(["vertical_feet > ?", filter_param])
    else
      Run.all
    end
  end
end
