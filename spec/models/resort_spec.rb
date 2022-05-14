require 'rails_helper'

RSpec.describe Resort, type: :model do
  it {should have_many :runs}
 
end
