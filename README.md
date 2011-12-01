# Ponch

Simple email analytics for your Rails app

---

## Information

**Ponch** lets you track opened emails if you're using your own sendmail server or Amazon SES.

Only works on Rails 3.x

It works by inserting an 1x1 tracking gif on your html emails and adding a controller that handles the request to that image.

## Installation

Simply add in your Gemfile

``` ruby
gem 'carrierwave'
```

and then set in your environment.rb

``` ruby
config.ponch.url_options = {host: "localhost", port: 3000}
```

And then Ponch takes care of the rest for you!

