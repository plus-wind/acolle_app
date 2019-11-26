class Review < ApplicationRecord
	belongs_to :item
	belongs_to :user
	ratyrate_rateable "satisfaction"
	validates :review_title, length: { in: 1..20 }
	validates :review_content, length: { in: 1..150 }
	validates :satisfaction, length: { in: 1..20 }

  	def self.reviewed_by(user,item)
    	Review.find_by(user_id: user.id,item_id: item.id)
	end
end

