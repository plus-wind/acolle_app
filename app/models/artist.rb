class Artist < ApplicationRecord
	has_many :items, dependent: :destroy, inverse_of: :artist
end
