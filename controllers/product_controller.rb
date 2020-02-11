require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/product.rb' )
also_reload( '../models/*' )

get '/products/show' do
  @products = Product.all
  p @products
  erb(:"products/show")
end

get '/products' do
  @products = Product.all()
  erb ( :"products/index" )
end

get '/products/:id' do
  @product = Product.find(params['id'].to_i)
  erb(:"products/show")
end

post '/products/:id/delete' do
  Product.destroy(params[:id])
  redirect to("/products")
end


# # CREATE - CREATE
#   post '/products/new' do
#     @product =Product.new(params)
#     @product.save()
#     erb(:create)
#   end
