require 'ponch/routes'

module Ponch
  class Engine < ::Rails::Engine#:nodoc:
    #action mailer register_interceptor

    ::ActionDispatch::Routing::Mapper.send :include, Routes

  end
end
