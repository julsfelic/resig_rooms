require 'rails_helper'

RSpec.describe 'GET /api/v1/rooms/:id?api_key=<API_KEY>' do
  it 'returns the room with the given id' do
    user = create(:user)
    user.api_keys << create(:api_key)
    access_token = user.api_keys.first.access_token
    room1 = create(:room)

    get "/api/v1/rooms/#{room1.id}?api_key=#{access_token}"
    json_body = JSON.parse(response.body)

    expect(json_body).to eq(
      'id'    => room1.id,
      'name'  => room1.name,
      'price' => room1.price
    )
  end

  it 'returns a 401 unauthorized when given an improper id' do
    user = create(:user)
    user.api_keys << create(:api_key)
    access_token = user.api_keys.first.access_token
    get "/api/v1/rooms/24?api_key#{access_token}"

    expect(response.status).to eq 401
  end
end
