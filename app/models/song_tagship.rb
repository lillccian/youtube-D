class SongTagship < ApplicationRecord
	belongs_to :tags
	belongs_to :songs
end
