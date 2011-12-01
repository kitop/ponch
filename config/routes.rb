Rails.application.routes.draw do

  get "ponch/tracking/:code.gif" => "ponch/tracking#pixel", as: "ponch_pixel"

end

