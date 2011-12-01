module Ponch
  class Config

    attr_writer :url_options

    def url_options
      @url_options || ActionMailer::Base.default_url_options
    end

  end
end
