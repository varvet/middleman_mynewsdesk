# Middleman Mynewsdesk plugin

A Middleman plugin for fetching your press releases from [Mynewsdesk](https://www.mynewsdesk.com).

## Installation

Add the gem to your `Gemfile`:

```ruby
gem "middleman_mynewsdesk"
```

Run `bundle install`

Add the following line to your config.rb:

```ruby
activate :middleman_mynewsdesk, api_key: "YOUR-API-TOKEN"
```

When you start the app you should have a global list of items waiting for you. A common way of using it is with proxies:

```ruby
  mynewsdesk_items.each do |item|
    proxy "/news/#{item.published_at}/index.html",
      "/templates/news_article.html",
      locals: { news_article: item }
  end
```
