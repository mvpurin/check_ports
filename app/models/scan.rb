class Scan < ApplicationRecord
  has_many :scanned_ports
  belongs_to :user
end
