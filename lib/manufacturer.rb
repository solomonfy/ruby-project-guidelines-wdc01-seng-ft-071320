class Manufacturer < ActiveRecord::Base
    has_many :vehicles, as: :drivable

end