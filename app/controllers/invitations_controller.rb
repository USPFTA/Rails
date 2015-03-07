class InvitationsController < ApplicationController
  before_action :authenticate_user_from_token!
  before_action :set_invitation, :only => [:accept_invitation, :decline_invitation]

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

  def index
    @players = []
    User.where(in_game: false).find_each do |user|
      @players << user
    end
    render json: {:players => @players}, status: :ok
  end



  # iOS specific controller methods


  def my_invitations
    @invitations = current_user.my_invitations
    if @invitations.length > 0
      render json: {:invitations => @invitations}, status: :ok
    else
      render json: {:invitations => nil}, status: :ok
    end
  end


  def accept_invitation
    @game = Game.find(@invitation.game_id)
    if @game.users << current_user
      current_user.in_game = true
      current_user.save
      @invitation.destroy
      render json: {:game => @game}, status: :accepted
    else
      render json: {:errors => [@game.errors.full_messages, @invitation.errors.full_messages, @user.errors.full_messages]}, status: :unprocessable_entity
    end
  end

  def decline_invitation
    if @invitation.destroy
      render json: {:invitation => nil}, status: :accepted
    else
      render json: {:errors => @invitation.errors.full_messages}, status: :unprocessable_entity
    end
  end




    private

      def set_invitation
        @invitation = Invitation.find(params[:id])
      end

      def invitation_params
        params.require(:invitation).permit(:inviter_id, :invited_id, :game_id)
      end

      def as_json(opts={})
        super(:only => [:inviter_id, :invited_id, :game_id])
      end

end