class GamesController < ApplicationController
  before_action :set_game, only: [:show, :finished]
  

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

  def finished
    @game.finished!


  end


  private

    def set_game
      @game = Game.find(params[:id])
    end

    def as_json(opts={})
      super(:only =>[:id, :center_lat, :center_long, :radius, :ends_at, :number_of_flags])
    end

end