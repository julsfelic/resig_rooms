require 'rails_helper'

RSpec.describe Room, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:price) }
  it { should validate_numericality_of(:price).only_integer }
end
