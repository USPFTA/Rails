class UsersController < ApplicationController
  before_action :authenticate_user_from_token!

  def show
    @user = current_user
    render json: { :user => @user }, status: :ok
  end

  def index
    @users = User.all
    render json: { :users => @users}, status: :ok
  end




  private

    def as_json(opts={})
      super(:only => [:id, :email])
    end

end
