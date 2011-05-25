module ViewHelper
	def rating_url(record, value)
		#url_for :controller => record.class.to_s.downcase.pluralize, :id => record.to_param, :action => "rate", :rating => value
		rate_product_path(record,:rating =>value)
		#url_for :action => 'index'
	end
	
    def render_rating(record, type=:simple, units="star")
      case type
      when :simple
        "#{record.rating}/#{record.maximum_rating_allowed} #{pluralize(record.rating, units)}"
      when :interactive_stars
		result=''.html_safe
        content_tag(:ul, :class => "rating #{record.rating_in_words}star") do
          (record.minimum_rating_allowed..record.maximum_rating_allowed).map do |i|
            result+=content_tag(:li, link_to(i, rating_url(record, i), :title => "Rate this #{pluralize(i, units)} out of #{record.maximum_rating_allowed}", :method => :put), :class => "rating-#{i}")
          end
		  result
        end
      end
    end
end
