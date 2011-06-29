class SpreeDigitalHooks < Spree::ThemeSupport::HookListener

	insert_after :product_description do
		<<-END
		<% if false %><!-- comment -->
		<h1>Rating: <%= @product.rating %></h1>(/<%= @product.ratings.size %> users)
		<!-- end comment --><% end %>

		<%= render_rating(@product, :interactive_stars) %>

		END
	end

	insert_before :account_my_orders do
		<<-END
		<h2><%= t("my_ratings") %></h2>
		<%= render @user.ratings %><br>
		END
	end
	
	insert_after :inside_head do
		<<-END
		<%= stylesheet_link_tag("stars") %>
		<%= stylesheet_link_tag("ratings") %>
		<%= stylesheet_link_tag 'screen - black', :media => 'screen' %>
		END
	end	
	
	insert_before :inside_footer do
		<<-END

		END
	end
end