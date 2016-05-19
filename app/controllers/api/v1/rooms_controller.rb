class Api::V1::RoomsController < ApiController
  before_action :restrict_access

  def index
    respond_with Room.all
  end

  private

  def restrict_access
    api_key = ApiKey.find_by(access_token: params[:api_key])
    head :unauthorized unless api_key
  end
end
