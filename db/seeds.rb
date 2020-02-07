require_relative('../models/supplier')
require_relative('../models/product')
require_relative('../models/stock')

require("pry-byebug")

Supplier.delete_all()
Product.delete_all()
Stock.delete_all()

  supplier1 = Supplier.new({
    "name" => "Mercedes",
    "contact details" =>
        "Mercedes-Benz Cars UK Ltd
         Tel: 08081 565 635" })
  supplier1.save



  product1 = Product.new({
    "name" => "SLK-Class 280 (R173)",
    "description" =>
        "Two-passenger, front-engine, rear-drive, retractable hardtop roadster",
    "supplier_id" => 1,
    "cost" => 21000,
    "retail" => 39000 })
  product1.save



  stock1 = Car.new({
    "product_id" => 1,
    "quantity" => 2,
    "colour" => "silverx1 redx1" })
  stock1.save







binding.pry
nil
