class Prettylink < ActiveRecord::Base
    belongs_to :user
    
    extend FriendlyId
    friendly_id :slug_candidates, use: [:title, :history]
    
    def slug_candidates
      [ [:title]]
    end
end
