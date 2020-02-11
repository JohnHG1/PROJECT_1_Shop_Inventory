require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/product.rb' )
also_reload( '../models/*' )

get '/products' do
  @products = Product.all()
  erb( :"products/index" )
end

get '/products/new' do
  @suppliers = Supplier.all()
  erb(:"products/new")
end

get "/products/:id" do
  @product = Product.find(params[:id].to_i)
  erb( :"products/show")
end

post '/products' do
  @product = Product.new(params)
  @product.save()
  redirect to "/products/#{@product.id}"
end

post "/products/:id" do
product = Product.new(params)
product.update()
redirect to "/products/#{params['id']}"
end

get '/products/:id/edit' do
  @product = Product.find(params[:id])
  @suppliers = Supplier.all()
  erb(:"products/edit")
end
