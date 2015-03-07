class Tag < ActiveRecord::Base
  belongs_to :flag
  belongs_to :player
end
