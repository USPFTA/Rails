class FlagsController < ApplicationController
  before_action :authenticate_user_from_token!
  

  def create
    @player = current_user.players.find_by_game_id(params[:flag][:game_id])
    
    @flag = Flag.new(flag_params)
    @flag.player = @player
    
    if @flag.save
      render json: {:flag: @flag}, status: :created
    else
      render json: { :error => @flag.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @flag = flag.find(params[:id])
    if @flag.destroy
      render json: {}, status: 200
    else
      render json: { error: "could not delete flag." }, status: 422
    end
  end

  private

    def as_json(opts={})
      super(:only => [:player_id, :flag_lat, :flag_long])
    end
  
  def flag_params
    params.require(:flag).permit(:membership_id, :flag_lat, :flag_long)
  end

end