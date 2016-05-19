class Api::V1::RoomsController < ApiController
  before_action :restrict_access

  def index
    respond_with Room.all
  end

  def create
    respond_with Room.create(room_params), location: nil
  end

  private

  def room_params
    params.require(:room).permit(:name, :price)
  end

  def restrict_access
    api_key = ApiKey.find_by(access_token: params[:api_key])
    head :unauthorized unless api_key
  end
end
