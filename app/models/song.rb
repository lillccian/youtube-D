class Song < ApplicationRecord
	belongs_to :user
	has_many :ytlinks
	has_many :song_tagships, :dependent=>:destroy
	has_many :tags ,:through => :song_tagships
end
