# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Set Bulma formbuilder as default
ActionView::Base.default_form_builder = BulmaFormbuilder
