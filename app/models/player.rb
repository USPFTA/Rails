class Player < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  has_one :flag   # this is the flag this player creates
  has_many :tags

  #validates :user_id, uniqueness: {scope: :game_id}

end
