require_relative('../models/supplier')
require_relative('../models/product')

require("pry-byebug")

Product.delete_all()
Supplier.delete_all()


  supplier1 = Supplier.new({
    "name" => "Mercedes",
    "contact" =>
        "Mercedes-Benz Cars UK Ltd
         Tel: 08081 565 635" })
  supplier1.save

  supplier2 = Supplier.new({
    "name" => "BMW",
    "contact" =>
        "BMW UK Ltd
         Tel: 08081 123 4567" })
  supplier2.save

  supplier3 = Supplier.new({
    "name" => "FORD",
    "contact" =>
        "FORD Motors
         Tel: 0141 987 6543" })
  supplier3.save



  product1 = Product.new({
    "model" => "SLK-Class 280 (R184)",
    "description" =>
        "Two-passenger, front-engine, rear-drive, retractable hardtop convertible",
    "colour" => "Green",
    "cost" => 21000,
    "retail" => 39000,
    "quantity" => 2,
    "supplier_id" => supplier1.id
    })
  product1.save

  product2 = Product.new({
    "model" => "2 Series",
    "description" =>
        "four-passenger, front-engine, rear-drive, retractable hardtop convertible",
    "colour" => "Red",
    "cost" => 19000,
    "retail" => 29500,
    "supplier_id" => supplier2.id,
    "quantity" => 3  })
  product2.save

  product3 = Product.new({
    "model" => "SLK-Class 200 (R173)",
    "description" =>
        "Two-passenger, front-engine, rear-drive, retractable hardtop roadster",
    "colour" => "Silver",
    "cost" => 19000,
    "retail" => 27000,
    "supplier_id" => supplier1.id,
    "quantity" => 1  })
  product3.save




binding.pry
nil
