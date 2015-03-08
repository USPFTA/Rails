class Invitation < ActiveRecord::Base
  belongs_to :inviter, class_name: "User"
  belongs_to :invited, class_name: "User"
  belongs_to :game

  #after_create :send_invitation_email

  def send_invitation_email
    InvitationMailer.invitation_email(self.inviter, self.invited, self.game).deliver_now
  end

end
