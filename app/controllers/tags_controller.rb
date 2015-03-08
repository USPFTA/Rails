class TagsController < ApplicationController

  before_action :authenticate_user_from_token!

  def create
    @player = current_user.players.last
    @flag = Flag.find(tag_params[:flag_id].to_i)
    if (@flag.player_id != @player.id)
      @tag = Tag.new(tag_params)
      @tag.player_id = @player.id  
      if @tag.save
        render json: {:tag => @tag}, status: :ok
      else
        render json: {:error => @tag.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {:error => "A player cannot tag their own flag"}, status: :forbidden
    end
  end

  private

  def tag_params
  	params.require(:tag).permit(:flag_id)
  end

  def as_json
    super(:only => [:id, :player_id, :flag_id])
  end
end
