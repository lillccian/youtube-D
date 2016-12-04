class Song < ApplicationRecord
	belongs_to :user
	has_many :ytlinks
	has_many :song_tagships, :dependent=>:destroy
	has_many :songs ,:through => :song_tagship
end
