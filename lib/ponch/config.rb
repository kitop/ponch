module Ponch
  class Config

    attr_writer :url_options

    def url_options
      defaults.merge @url_options
    end

    def defaults
      ActionMailer::Base.default_url_options.merge(scheme: "http", path: "/ponch/tracking")
    end

  end
end
