module Ponch
  class Middleware

    def initialize(app, options = {})
      @app = app
    end

    def call(env)
      dup._call(env)
    end

    def _call(env)
      response = catch(:halt) do

        req = Rack::Request.new(env)
        if req.params['ponch']

          if delivery = Ponch::Delivery.find_by_code(req.params['ponch'])
            delivery.open_and_click!(req.ip)
          end
          nil
        elsif match = req.path.match(/^#{Ponch.config.url_options[:path]}\/([a-fA-F0-9]+)\.gif$/)
          delivery = Ponch::Delivery.find_by_code match[1]

          delivery.open!(req.ip) if delivery

          gif_path = File.expand_path('../../../images/blank.gif', __FILE__)

          throw :halt, [200, { "Content-Type" => "image/gif" }, [File.read( gif_path )] ]
        end
        nil
      end

      response || @app.call(env)

    end

  end
end
