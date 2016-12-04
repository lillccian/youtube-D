class SongTagship < ApplicationRecord
	belongs_to :tag
	belongs_to :song
end
