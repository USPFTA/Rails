class InvitationsController < ApplicationController
  #before_action :authenticate_user_from_token!

  def create
    @invitation = Invitation.new(invitation_params)
    if @invitation.save
      render json: {:invitation => @invitation}, status: :ok
    else
      render json: {:invitation => @invitation.errors.full_messages}, status: :unprocessable_entity
    end
  end



  def show
    @user = current_user
    render json: {:user => @user}, status: :ok
  end

  def my_invitations
    @user = current_user
    @invitations = []
    Invitation.where(invited_id: @user.id).find_each |invite|
      @invitations << invite
    end
    if @invitations.length > 0
      render json: {:invitations => @invitations}, status: :ok
    else
      render json: {:invitations => nil}, status: :ok
    end
  end

  def index
    @players = []
    User.where(current_flag: nil).find_each do |user|
      @players << user
    end
    render json: {:players => @players}, status: :ok
  end






    private
      def invitation_params
        require(:invitation).permit(:inviter_id, :invited_id, :game_id)
      end

      def as_json(opts={})
        super(:only => [:inviter_id, :invited_id, :game_id])
      end

end