class Blog < ActiveRecord::Base
    belongs_to :user
    validates_presence_of :desc ,:title
    extend FriendlyId
    friendly_id :slug_candidates, use: [:slugged, :history]
    
    def slug_candidates
      [ [:title, :category]]
    end
    
    def should_generate_new_friendly_id?
      title_changed? || category_changed? || new_record?
    end
    
    def self.find(user)
     friendly.find(user)
    end 
end
