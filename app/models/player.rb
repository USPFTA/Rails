class Player < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  has_one :flag   # this is the flag this player creates
  has_many :tags

end
