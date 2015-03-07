class Invitation < ActiveRecord::Base
  belongs_to :inviter, class_name: "User"
  belongs_to :invited, class_name: "User"
  belongs_to :game


  def self.my_invitations
    @invitations = []
    Invitation.where(invited_id: @user.id).find_each do |invite|
      @invitations << invite
    end
    @invitations
  end

end
