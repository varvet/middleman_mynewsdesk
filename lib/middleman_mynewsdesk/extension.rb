# Require core library
require 'middleman-core'

# Extension namespace
class Mynewsdesk < ::Middleman::Extension
  option :my_option, 'default', 'An example option'

  def initialize(app, options_hash={}, &block)
    # Call super to build options from the options_hash
    super

    # Require libraries only when activated
    # require 'necessary/library'

    # set up your extension
    puts options.api_key
  end

  def after_configuration
    # Do something
  end

  # A Sitemap Manipulator
  def manipulate_resource_list(resources)
    pp resources
  end

  # helpers do
  #   def a_helper
  #   end
  # end
end
