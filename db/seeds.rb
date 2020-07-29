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


enterprise = Dealer.create(name: "Enterprise", account_balance: 2781425)
penske = Dealer.create(name: "Penske", account_balance: 4087295)
carvana = Dealer.create(name: "Carvana", account_balance: 3142863)
car_max = Dealer.create(name: "Car Max", account_balance: 1445239)

toyota = Manufacturer.create(name: "Toyota")
honda = Manufacturer.create(name: "Honda")
nissan = Manufacturer.create(name: "Nissan")

yaris = Vehicle.create(model: "Yaris", make: "Toyota", year: 2020, milage: 423, owner: toyota, model_number: 10)
rav4 = Vehicle.create(model: "Rav4", make: "Toyota", year: 2019, milage: 124, owner: toyota, model_number: 11)
highlander = Vehicle.create(model: "Highlander", make: "Toyota", year: 2020, milage: 30, owner: toyota, model_number: 12)
lexus = Vehicle.create(model: "Lexus", make: "Toyota", year: 2018, milage: 23097, owner: toyota, model_number: 13)

pathfinder = Vehicle.create(model: "Pathfinder", make: "Nissan", year: 2017, milage: 36824, owner: nissan, model_number: 221)
altima = Vehicle.create(model: "Altima", make: "Nissan", year: 2014, milage: 83241, owner: nissan, model_number: 222)

pilot = Vehicle.create(model: "Pilot", make: "Honda", year: 2020, milage: 325, owner: honda, model_number: 4001)
civic = Vehicle.create(model: "Civic", make: "Honda", year: 2020, milage: 25, owner: honda, model_number:4004)



