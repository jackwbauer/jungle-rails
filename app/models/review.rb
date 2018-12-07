class Review < ActiveRecord::Base

    default_scope { order(created_at: :desc ) }

    belongs_to :product
    belongs_to :user
    
end
