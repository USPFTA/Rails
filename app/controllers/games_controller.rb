class GamesController < ApplicationController
  before_action :set_game, only: [:show, :index, :finished]
  #before_action :authenticate_user_from_token!
  

  def create
    @game = Game.new(game_params)
    if @game
      @game.save
      render json: {:game => @game}, status: :ok
    else
      render json: {:error => @game.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    if @game
      render json: {:game => @game}, status: :ok
    else
      render json: {:error => 'There is no game matching that ID'}, status: :unprocessable_entity
    end
  end

  def index
    if @game
      render json: {:game => @game, :users => @game.players}, status: :ok
    else
      render json: {:game => nil}, status: :unprocessable_entity
    end
  end

  def finished
    if @game.finished?
      render json: {:game => @game, :message => 'Game is over'}, status: :ok
    else
      render json: {:game => @game}, status: :ok
    end
  end


  private

    def set_game
      @game = Game.find(params[:id])
    end

    def as_json(opts={})
      super(:only =>[:id, :center_lat, :center_long, :radius, :ends_at, :number_of_flags])
    end

    def game_params
      params.require(:game).permit(:center_lat, :center_long, :starts_at, :ends_at, :radius, :number_of_flags)
    end

end