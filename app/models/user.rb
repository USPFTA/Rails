class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :games, through: :players
  has_many :players
  has_one :flag

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :ensure_authentication_token

  


  def my_invitations
    @invitations = []
    Invitation.where(invited_id: self.id).find_each do |invite|
      @invitations << invite
    end
    @invitations
  end




  # AUTHENTICATION SHIT, DO NOT TOUCH THIS


  def ensure_authentication_token
    if authentication_token.blank?
       self.authentication_token = generate_authentication_token
    end
  end

  def as_json(opts={})
    super(:only => [:email, :authentication_token, :experience, :id])
  end

 private
 def generate_authentication_token
   loop do
     token = Devise.friendly_token
     break token unless User.where(authentication_token: token).first
   end
 end

end
