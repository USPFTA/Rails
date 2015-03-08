class TagsController < ApplicationController

  before_action :authenticate_user_from_token!

  def create
  	#expects a flag_id in the tags param hash
    @player = current_user.players.last
    if (@flag.user_id != current_user.id)
      @tag = Tag.new(tag_params)
      @tag.player_id = @player.id

    # at this point, player and flag should be assigned to this tag so it should be valid
    
      if @tag.save
        render json: {:tag => @tag}, status: :ok
      else
        render json: {:error => @tag.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {:error => {"A player cannot tag their own flag"}}, status: :forbidden
    end

  private

  def tag_params
  	params.require(:tag).permit(:flag_id)
  end

end
