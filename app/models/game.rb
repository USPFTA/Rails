class Game < ActiveRecord::Base


  has_many :players
  has_many :users, through: :players
  has_many :flags, through: :players

  # validations

  validates :center_lat, presence: true
  validates :center_long, presence: true
  validates :radius, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true

  validates_length_of :users, maximum: 10

#  validates :user_id, uniqueness: {scope: :users}




  def set_end_time!
    self.ends_at = (self.starts_at + self.duration.hour)
  end


  def finished?
    check_time = Time.now
    if check_time < self.ends_at
      if self.game_flags.count < (self.players.count*self.players.count-self.players.count)
        self.finished = false
        self.save
      else
        self.finished = true
        self.save
      end
    else
      self.finished = true
      self.save
    end
  end

end
