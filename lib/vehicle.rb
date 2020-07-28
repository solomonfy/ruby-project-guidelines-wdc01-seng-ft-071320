class Vehicle < ApplicationRecord
    belongs_to :drivable, polymorphic: true
end