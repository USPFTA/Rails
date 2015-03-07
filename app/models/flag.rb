class Flag < ActiveRecord::Base
  
  belongs_to :player
  has_one :game, through: :player
  has_one :user, through: :player
  has_many :tags

  validates :player, presence:true
end
