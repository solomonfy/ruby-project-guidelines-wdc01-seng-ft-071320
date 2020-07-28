class Dealer < ActiveRecord::Base
    has_many :vehicles, as: :owner
end