# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Spree::Config.set(:logo => 'logo.jpg')
TestSpree::Application.initialize!

ActionView::Base.send   :include, ViewHelper
