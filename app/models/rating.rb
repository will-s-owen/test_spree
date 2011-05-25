class Rating < ActiveRecord::Base
	attr_accessible :rater_id
	belongs_to :product
	belongs_to :user
	
	scope :mine, where(:rater_id => User.current)
	
end
