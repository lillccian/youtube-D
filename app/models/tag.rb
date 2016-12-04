class Tag < ApplicationRecord
	has_many :song_tagships, :dependent=>:destroy
	has_many :tags ,:through => :song_tagship
end
