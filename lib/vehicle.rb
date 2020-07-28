class Vehicle < ActiveRecord::Base
    belongs_to :drivable, polymorphic: true
end