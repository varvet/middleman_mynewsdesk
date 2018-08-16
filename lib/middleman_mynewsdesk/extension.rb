# frozen_string_literal: true

# Require core library
require "middleman-core"

# Extension namespace
class Mynewsdesk < ::Middleman::Extension
  option :api_key, "api_key", "Mynewsdesk API key"
  expose_to_config mynewsdesk_items: :mynewsdesk_items
  expose_to_template mynewsdesk_items: :mynewsdesk_items

  def initialize(app, options_hash = {}, &block)
    # Call super to build options from the options_hash
    super

    # Require libraries only when activated
    require "http"
    require "json"

    @base_url = "https://www.mynewsdesk.com/services/pressroom/list/#{options.api_key}?format=json"
  end

  def mynewsdesk_items
    @items ||= JSON.parse(HTTP.get(@base_url).to_s, object_class: RecursiveOpenStruct).items.item
    @items
  end
end
