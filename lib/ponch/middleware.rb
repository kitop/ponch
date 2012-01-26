module Ponch
  class Middleware

    def initialize(app, options = {})
      @app = app
    end

    def call(env)
      dup._call(env)
    end

    def _call(env)

      req = Rack::Request.new(env)
      if req.params['ponch']
        delivery = Ponch::Delivery.find_by_code req.params['ponch']
        if delivery
          delivery.open_and_click!(req.ip)
        end
      end

      @app.call(env)
    end

  end
end
