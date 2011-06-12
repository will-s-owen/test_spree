ProductOptionType.class_eval do
	scope :position, :order => 'position ASC'
	
	def build_subsections
		
	end
end
