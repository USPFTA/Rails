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

  def active_game
    # returns the user's active game if it exists
    self.games.where(finished: false).first
  end

  def active_player
    # returns the active player for this user, i.e, the player for the game he is in
    if active_game
      return active_game.players.find_by_user_id(self.id)
    else
      return nil
    end
  end

 private
 def generate_authentication_token
   loop do
     token = Devise.friendly_token
     break token unless User.where(authentication_token: token).first
   end
 end

end
