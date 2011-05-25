ProductsController.class_eval do
public
    def rate
		@product = Product.id_equals(params[:id])
		@current_user = User.current
		@rating = @product.ratings.mine

		redirect_to "/products/#{params[:id]}"
		return
    end
end
