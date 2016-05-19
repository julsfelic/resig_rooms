class Room < ActiveRecord::Base
  validates :name, :price, presence: true
  validates :price, numericality: { only_integer: true }
end
