# frozen_string_literal: true

require "uri"

class MynewsdeskItem < SimpleDelegator
  def title
    header
  end

  def slug
    URI.parse(url).path.split("/").last
  end

  def date
    DateTime.strptime(published_at, "%Y-%m-%d %H:%M:%S")
  end
end
