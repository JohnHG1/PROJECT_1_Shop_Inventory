require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/supplier.rb' )
require_relative( '../models/product.rb' )
require_relative( '../models/stock.rb' )
also_reload( '../models/*' )

get '/suppliers' do
  @suppliers = Supplier.all
  @actions = Action.all
  erb ( :"suppliers/index" )
end

get '/suppliers/new' do
  @stocks = Stock.all
  @products = Product.all
  erb(:"suppliers/new")
end

post '/suppliers' do
  supplier = Supplier.new(params)
  supplier.save
  redirect to("/suppliers")
end

post '/suppliers/:id/delete' do
  Supplier.destroy(params[:id])
  redirect to("/suppliers")
end
