require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/product_controller')
require_relative('controllers/stock_controller')
require_relative('controllers/supplier_controller')

get '/' do
  erb( :index )
end
