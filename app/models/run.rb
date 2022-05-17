class Run < ApplicationRecord
  belongs_to :resort

  def self.is_open
    where(is_open: true)
  end

end
