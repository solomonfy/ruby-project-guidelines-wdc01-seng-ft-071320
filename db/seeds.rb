Buyer.destroy_all
Dealer.destroy_all
Manufacturer.destroy_all
Vehicle.destroy_all


3.times do
    Vehicle.find_or_create_by(name: Faker::Vehicle.model(make_of_model: 'Toyota'))
    # Vehicle.find_or_create_by(name: (Faker::Vehicle.car_type))
    # Faker::Vehicle.make_and_model 
end

