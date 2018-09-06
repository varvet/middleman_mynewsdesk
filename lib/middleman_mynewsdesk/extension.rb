# frozen_string_literal: true

# Require core library
require "middleman-core"

# Extension namespace
class Mynewsdesk < ::Middleman::Extension
  option :api_key, "api_key", "Mynewsdesk API key"
  option :types_of_media, [:pressrelease], "Types of media to include"
  
  expose_to_config mynewsdesk_items: :mynewsdesk_items
  expose_to_template mynewsdesk_items: :mynewsdesk_items

  def initialize(app, options_hash = {}, &block)
    # Call super to build options from the options_hash
    super

    # Require libraries only when activated
    require "http"
    require "json"

    @base_url = "https://www.mynewsdesk.com/services/pressroom/list/#{options.api_key}?format=json&limit=100"
  end

  def all_items_for(item)
    items = []
    0.step(2000, 100) do |offset|
      i = items_for_offset(item, offset)
      items.concat i
      break if i.length < 100
    end
    items
  end

  def items_for_offset(item, offset)
    JSON.parse(HTTP.get("#{@base_url}&type_of_media=#{item}&offset=#{offset}").to_s, object_class: RecursiveOpenStruct).items.item
  end

  def mynewsdesk_items
    @items ||= options.types_of_media.map do |item|
                 all_items_for(item)
               end.flatten.sort { |a, b| Time.parse(b.published_at) <=> Time.parse(a.published_at) }

    @items
  end
end
