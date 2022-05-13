require 'rails_helper'

RSpec.describe Run, type: :model do
  it {should belong_to :resort}
end
