class Pin < ActiveRecord::Base
    belongs_to :user
    has_attached_file :image, :styles => { :medium => "240x300>", :thumb => "50x50>", :normal => "420x680>"  },
                    :storage => :dropbox,
                    :dropbox_credentials => Rails.root.join("config/dropbox.yml")
                    
    validates_presence_of :descrption,:image              
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
