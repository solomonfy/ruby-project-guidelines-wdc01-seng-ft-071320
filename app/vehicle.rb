class Vehicle < ActiveRecord::Base
    belongs_to :owner, polymorphic: true

    def initialize(attributes=nil)
        super(attributes)
        self.price = 5000
        self.year = 2010
        self.milage = 100
    end

end