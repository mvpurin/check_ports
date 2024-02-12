class CreateScannedPorts < ActiveRecord::Migration[7.1]
  def change
    create_table :scanned_ports do |t|
      t.integer :port_number
      t.string :status
      t.string :web_server
      t.references :scan

      t.timestamps
    end
  end
end
