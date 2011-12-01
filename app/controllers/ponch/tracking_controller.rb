class Ponch::TrackingController < ActionController::Base

  def pixel
    ponch_delivery = Ponch::Delivery.find_by_code params[:code]

    ponch_delivery.open!(request.remote_ip) if ponch_delivery

    send_file File.expand_path('../../../../images/blank.gif', __FILE__),
              type: "image/gif", disposition: 'inline', stream: false
  end

end
