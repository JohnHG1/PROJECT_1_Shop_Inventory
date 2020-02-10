require_relative('../models/supplier')
require_relative('../models/product')
require_relative('../models/stock')

require("pry-byebug")

# Stock.delete_all()
# Product.delete_all()
# Supplier.delete_all()


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
    "name" => "SLK-Class 280 (R184)",
    "description" =>
        "Two-passenger, front-engine, rear-drive, retractable hardtop convertible",
    "supplier_id" => 1,
    "cost" => 21000,
    "retail" => 39000 })
  product1.save

  product2 = Product.new({
    "name" => "BMW 2 Series",
    "description" =>
        "four-passenger, front-engine, rear-drive, retractable hardtop convertible",
    "supplier_id" => 2,
    "cost" => 19000,
    "retail" => 29500 })
  product2.save

  product3 = Product.new({
    "name" => "SLK-Class 200 (R173)",
    "description" =>
        "Two-passenger, front-engine, rear-drive, retractable hardtop roadster",
    "supplier_id" => 1,
    "cost" => 19000,
    "retail" => 27000 })
  product3.save


  stock1 = Car.new({
    "product_id" => 1,
    "quantity" => 2,
    "colour" => "silverx1 redx1" })
  stock1.save

  stock2 = Car.new({
    "product_id" => 2,
    "quantity" => 1,
    "colour" => "greenx1" })
  stock2.save

  stock3 = Car.new({
    "product_id" => 3,
    "quantity" => 1,
    "colour" => "blackx1" })
  stock1.save



binding.pry
nil
