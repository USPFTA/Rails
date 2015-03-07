class GamesController < ApplicationController
  before_action :set_game, only: [:show, :add_players, :index, :finished]
  before_action :authenticate_user_from_token!
  

  def create
    @game = Game.new(game_params)
    if @game
      @game.save
      render json: {:game => @game}, status: :ok
    else
      render json: {:error => @game.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def available_players
    @players = []
    User.where(current_flag: nil).find_each do |user|
      @players << user
    end
    render json: {:players => @players}, status: :ok
  end

  def add_players
    @players = player_params[:players]
    @players.each do |user_id|
      user = User.find(user_id)
      @game.players.create(user.user_id, @game.id)
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

    def player_params
      params.require(:players).permit(:user_id)
    end

end