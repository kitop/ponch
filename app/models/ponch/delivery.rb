module Ponch
  class Delivery < ActiveRecord::Base
    self.table_name = "ponch_deliveries"

    validates_presence_of :to, :from, :sent_at

    scope :opened, where("opened_at is not null")

    before_create :generate_code

    def opened?
      !opened_at.nil?
    end

    def clicked?
      !clicked_at.nil?
    end

    def open!(ip_address = nil, do_save = true)
      unless opened?
        self.opened_at = Time.now
        self.opened_ip = ip_address
        self.save! if do_save
      end
    end

    def open_and_click!(ip_address = nil)
      open!(ip_address, false)
      unless clicked?
        self.clicked_at = Time.now
        self.clicked_ip = ip_address
        self.save!
      end
    end

    #class methods
    def self.create_from_mail(mail)
      self.create!  to: mail.to.first,
                    from: mail.from.first,
                    subject: mail.subject,
                    sent_at: Time.now
    end

    private
    def generate_code
      self.code = loop do
        code_attempt = SecureRandom.hex(20)
        break code_attempt unless self.class.find_by_code(code_attempt)
      end
    end

  end
end
