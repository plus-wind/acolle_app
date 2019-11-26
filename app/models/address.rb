class Address < ApplicationRecord
	belongs_to :user

	validates :delivery_name_family_kanji, presence: true
	validates :delivery_name_first_kanji, presence: true
	VALID_NAME_FURIGANA_REGEX = /\A[ァ-ヶー－]+\z/
 	validates :delivery_name_family_furigana, presence: true ,format: { with: VALID_NAME_FURIGANA_REGEX }
  	validates :delivery_name_first_furigana, presence: true ,format: { with: VALID_NAME_FURIGANA_REGEX }
  	validates :delivery_postal_code, presence: true, length: { is: 7 }
  	validates :delivery_address_prefecture, presence: true
  	validates :delivery_address_city, presence: true
end
