class Review < ApplicationRecord
	belongs_to :item
	belongs_to :user
	ratyrate_rateable "satisfaction"

  	def self.reviewed_by(user,item)
    	Review.find_by(user_id: user.id,item_id: item.id)
	end
end

