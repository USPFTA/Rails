class InvitationMailer < ApplicationMailer
  default from: 'tiy.hackathon@gmail.com'


  def invitation_email(sender, recipient, game)
    @sender = sender
    @recipient = recipient
    @game = game
    binding.pry
    mail(to: @recipient.email, subject: 'You have been invited to play!')
  end


end
