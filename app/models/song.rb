class Song < ApplicationRecord
	belongs_to :user
	has_many :ytlinks
	has_many :song_tagships, :dependent=>:destroy
	has_many :tags ,:through => :song_tagships

	def view!
    if self.view_count.nil?
      self.view_count = 1
      self.save
    else
      self.view_count += 1
      self.save
    end
  end
end
