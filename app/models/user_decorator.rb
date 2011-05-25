User.class_eval do
	has_many :ratings, :foreign_key => "rater_id"
	
end
