require 'rails_helper'

RSpec.describe ApiKey, type: :model do
  it { should belong_to(:user) }
  it { should validate_uniqueness_of(:access_token) }

  it 'generates a key on creation' do
    api_key = ApiKey.create

    expect(api_key.access_token.length).to eq 32
  end
end
