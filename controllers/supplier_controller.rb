require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/supplier.rb' )
require_relative( '../models/product.rb' )
require_relative( '../models/stock.rb' )
also_reload( '../models/*' )

# INDEX
get '/suppliers' do
  @suppliers = Supplier.all
  erb ( :"suppliers/index" )
end

# show
get '/suppliers/:id' do
  @supplier = Supplier.find(params['id'].to_i)
  erb( :"suppliers/show" )
end
#




# get '/suppliers/new' do
#   @stocks = Stock.all
#   @products = Product.all
#   erb(:"suppliers/new")
# end
#
# post '/suppliers' do
#   supplier = Supplier.new(params)
#   supplier.save
#   redirect to("/suppliers")
# end
#
# post '/suppliers/:id/delete' do
#   Supplier.destroy(params[:id])
#   redirect to("/suppliers")
# end
