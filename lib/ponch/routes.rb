module Ponch
  module Routes
    def ponch_tracking
      get "ponch/tracking/:code.gif" => "ponch/tracking#pixel", as: "ponch_pixel"
    end
  end
end

