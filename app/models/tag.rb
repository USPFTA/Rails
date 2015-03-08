class Tag < ActiveRecord::Base
  belongs_to :flag
  belongs_to :player

  has_attached_file :image, 
    :styles => { :thumb => "100x100>" },
    :storage => :s3,
    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

  def s3_credentials
        {:bucket => "tiy-hackathon", 
          :access_key_id => "AKIAJSN36GEMDFZRJ5WA", 
          :secret_access_key => "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"}
  end

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  validates :player_id, uniqueness: {scope: :flag_id}
end


