ProductsController.class_eval do
public
	before_filter :load_text
	def load_text
		@license_text = render_to_string('license.html', :content_type => 'text/html', :layout => false)
		#@license_text=IO.read("#{RAILS_ROOT}/app/views/products/license.html").encode("UTF-8")
	end
	
    def rate
		@product = Product.id_equals(params[:id])
		#@current_user = User.current
		@rating = @product.ratings.mine

		redirect_to "/products/#{params[:id]}"
		return
    end
	
	def options
		@product = Product.id_equals(params[:id])
		respond_to do |format|
			format.json  { render :json => @subsections }      
		end
	end
	
end
