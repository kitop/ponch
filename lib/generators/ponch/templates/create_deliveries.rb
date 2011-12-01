class CreatePonchDeliveries < ActiveRecord::Migration

  def self.up
    create_table :ponch_deliveries do |t|
      t.string   :to,           :null => false
      t.string   :from,         :null => false
      t.string   :subject

      t.string   :code,         :null => false
      t.datetime :sent_at,      :null => false

      t.datetime :opened_at
      t.string   :opened_ip

      t.datetime :clicked_at
      t.string   :clicked_ip
    end
    add_index :ponch_deliveries, :code, unique: true
  end

  def self.down
    drop_table :ponch_deliveries
  end

end
