module Ponch
  class Delivery < ActiveRecord::Base
    set_table_name :ponch_deliveries

    scope :opened, where("opened_at is not null")

    def opened?
      !!opened_at.nil?
    end

    def open!(ip_address = nil)
      self.opened_at = Time.now
      self.opened_ip = ip_address
      self.save! unless opened?
    end

  end
end
