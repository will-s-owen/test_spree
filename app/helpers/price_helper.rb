module PriceHelper
	def build_variant_price_id(v)
		variant_id=""
		v.option_values.each do |ov|
			variant_id+="#{ov.id}"
		end
		variant_id
	end
end
