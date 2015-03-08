class Tag < ActiveRecord::Base
  belongs_to :flag
  belongs_to :player

  has_attached_file :image

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  validates :player_id, uniqueness: {scope: :flag_id}
end
