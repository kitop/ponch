# Ponch

Simple email analytics for your Rails app

## Information

**Ponch** lets you track opened emails if you're using your own sendmail server or Amazon SES.

Only works on Rails 3.x

It works by inserting an 1x1 tracking gif on your html emails and adding a controller that handles the request to that image.

## Installation

Simply add in your Gemfile

``` ruby
gem 'ponch'
```

and then set in your config/environment.rb (or in each environment file) the details for 

``` ruby
config.ponch.url_options = {host: "localhost", port: 3000}
```

And then Ponch takes care of the rest for you!

## Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with Rakefile, version, or history.
  (if you want to have your own version, that is fine but
   bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Licence

Ponch is released under the MIT license.

![Ponch](/ponch.jpg)
