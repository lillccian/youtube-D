class Song < ApplicationRecord
	belongs_to :user
	has_many :ytlinks
end
