require 'rails_helper'

RSpec.describe 'GET /api/v1/rooms?api_key=<API_KEY>', type: :request do
  it 'displays all rooms' do
    user = create(:user)
    user.api_keys << create(:api_key)
    access_token = user.api_keys.first.access_token
    room1 = create(:room)
    room2 = create(:room)

    get "/api/v1/rooms?api_key=#{access_token}"
    json_body = JSON.parse(response.body)
    room_1_json = json_body[0]

    expect(json_body.length).to eq 2
    expect(room_1_json).to eq({
      'id'    => room1.id,
      'name'  => room1.name,
      'price' => room1.price
    })
  end

  it 'returns a 401 unauthorized if not given a valid API key' do
    get "/api/v1/rooms?api_key=invalidkey"

    expect(response.status).to eq 401
  end
end
