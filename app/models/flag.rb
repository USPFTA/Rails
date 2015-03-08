class Flag < ActiveRecord::Base
  
  belongs_to :player
  has_one :game, through: :player
  has_one :user, through: :player
  has_many :tags

  validates :player_id, presence: true
  validates :flag_lat, presence: true
  validates :flag_long, presence: true


  def within_boundary(flag_coordinates, game)
    center_coordinates = [game.center_lat, game.center_long]
    distance_from_center = Geocoder::Calculations.distance_between(flag_coordinates, center_coordinates)
    if distance_from_center < game.radius
      return true
    else
      return false
    end
  end

end
