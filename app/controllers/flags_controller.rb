class FlagsController < ApplicationController
  before_action :authenticate_user_from_token!
  

  def create
    @player = current_user.players.last
    @flag = Flag.new(flag_params)
    flag_coordinates = [@flag.flag_lat, @flag.flag_long]
    @game = @player.game
    if @flag.within_boundary(flag_coordinates, @game)
      @flag.player = @player
      if @flag.save
        render json: {:flag => @flag}, status: :created
      else
        render json: { :error => @flag.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {:error => "Flag must be placed within the game area"}, status: :forbidden
    end
  end

  def destroy
    @flag = Flag.find(params[:id])
    if @flag.destroy
      render json: {}, status: 200
    else
      render json: { error: "could not delete flag." }, status: :unprocessable_entity
    end
  end


  private

    def as_json(opts={})
      super(:only => [:id, :player_id, :flag_lat, :flag_long])
    end
  
    def flag_params
      params.require(:flag).permit(:name, :player_id, :flag_lat, :flag_long)
    end

end