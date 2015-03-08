class Tag < ActiveRecord::Base
  belongs_to :flag
  belongs_to :player

  # validations

  validates :player_id, uniqueness: {scope: :flag_id}
end
