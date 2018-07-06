# frozen_string_literal: true

require "middleman-core"

Middleman::Extensions.register :middleman_mynewsdesk do
  require "middleman_mynewsdesk/extension"
  Mynewsdesk
end
