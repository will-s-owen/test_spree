Product.class_eval do
	has_many :ratings
	has_many :raters, :through => :ratings, :source => "rater_id"
	
	cattr_accessor :minimum_rating_allowed, :maximum_rating_allowed
	self.minimum_rating_allowed = 1
	self.maximum_rating_allowed = 5
	  
	def AvgRating
		ratings.average(:stars).sum.to_f/ratings.size
	end
	
	def rating
		if (rating = ratings.average(:stars))
			rating.round
		else
			0
		end
	end

    def rating_range
      minimum_rating_allowed..maximum_rating_allowed
    end
	
    def rate(value, options={})
      #ratings.create({ :stars => value }.merge(options))
    end
	
    def rating_in_words
      case rating
      when 0
        "no"
      when 1
        "one"
      when 2
        "two"
      when 3
        "three"
      when 4
        "four"
      when 5
        "five"
      else
        rating.to_s
      end
    end  
	
end
