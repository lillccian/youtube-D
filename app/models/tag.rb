class Tag < ApplicationRecord
	has_many :song_tagships, :dependent=>:destroy
	has_many :songs ,:through => :song_tagships
end
