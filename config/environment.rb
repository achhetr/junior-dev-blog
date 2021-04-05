# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# Remove errors thrown by Rails
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html_tag.html_safe
end
