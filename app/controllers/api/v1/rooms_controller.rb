module Api
  module V1
    class RoomsController < ApiController
      before_action :restrict_access

      def index
        respond_with Room.all
      end

      def show
        respond_with Room.find(params[:id])
      end

      def create
        respond_with Room.create(room_params), location: nil
      end

      def destroy
        if room = Room.find_by(id: params[:id])
          respond_with room.destroy
        else
          head :not_found
        end
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
  end
end
