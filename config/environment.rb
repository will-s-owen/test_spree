# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
TestSpree::Application.initialize!
Spree::Config.set(:logo => 'logo-black.jpg')

ActionView::Base.send   :include, ViewHelper
