class Song < ApplicationRecord
	belongs_to :user
	has_many :ytlinks
	has_many :tags 
  has_many :comments
  has_many :keeps
  has_many :keepedusers , :through => :keeps ,:dependent=>:destroy ,:source=> "user"
  has_many :likes
  has_many :likedusers , :through => :likes ,:dependent=>:destroy ,:source=> "user"
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
