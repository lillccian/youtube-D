class Song < ApplicationRecord
	belongs_to :user
	has_many :ytlinks,:dependent=>:destroy 
	has_many :tags ,:dependent=>:destroy 
  has_many :comments ,:dependent=>:destroy 
  has_many :keeps ,:dependent=>:destroy 
  has_many :keepedusers , :through => :keeps ,:dependent=>:destroy ,:source=> "user"
  has_many :likes ,:dependent=>:destroy 
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
