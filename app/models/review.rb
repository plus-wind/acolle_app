class Review < ApplicationRecord
	belongs_to :item
	belongs_to :user
	ratyrate_rateable "satisfaction"
end
