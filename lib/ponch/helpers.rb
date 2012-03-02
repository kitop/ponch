module Ponch
  module Helpers
    extend self

    def url_for(code)
      opts = Ponch.config.url_options

      opts[:path] = (opts[:path] + "/#{code}.gif").sub("//", "/")

      uri = URI::Generic.build opts

      uri.to_s
    end

  end
end
