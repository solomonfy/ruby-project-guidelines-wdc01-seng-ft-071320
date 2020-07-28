Buyer.destroy_all
Dealer.destroy_all
Manufacturer.destroy_all
Vehicle.destroy_all


tom = Buyer.create(name: "Tom")
john = Buyer.create(name: "John")
steve = Buyer.create(name: "Steve")
penn = Buyer.create(name: "Penn")
matine = Buyer.create(name: "Matine")
solomon = Buyer.create(name: "Solomon")


enterprise = Dealer.create(name: "Enterprise", inventory: 457, account_balance: 2781425)
penske = Dealer.create(name: "Penske", inventory: 857, account_balance: 4087295)
carvana = Dealer.create(name: "Carvana", inventory: 557, account_balance: 3142863)
car_max = Dealer.create(name: "Car Max", inventory: 123, account_balance: 1445239)

toyota = Manufacturer.create(name: "Toyota", inventory: 11340)
honda = Manufacturer.create(name: "Honda", inventory: 24108)
nissan = Manufacturer.create(name: "Nissan", inventory: 31985)

yaris = Vehicle.create(model: "Yaris", make: "Toyota", year: 2020, milage: 423, owner: toyota)
rav4 = Vehicle.create(model: "Rav4", make: "Toyota", year: 2019, milage: 124, owner: toyota)
highlander = Vehicle.create(model: "Highlander", make: "Toyota", year: 2020, milage: 30, owner: toyota)
lexus = Vehicle.create(model: "Lexus", make: "Toyota", year: 2018, milage: 23097, owner: toyota)

pathfinder = Vehicle.create(model: "Pathfinder", make: "Nissan", year: 2017, milage: 36824, owner: nissan)
altima = Vehicle.create(model: "Altima", make: "Nissan", year: 2014, milage: 83241, owner: nissan)

pilot = Vehicle.create(model: "Pilot", make: "Honda", year: 2020, milage: 325, owner: honda)
civic = Vehicle.create(model: "Civic", make: "Honda", year: 2020, milage: 25, owner: honda)