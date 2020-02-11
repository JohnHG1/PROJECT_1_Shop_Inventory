require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/supplier.rb' )
require_relative( '../models/product.rb' )
also_reload( '../models/*' )


get '/suppliers' do
  @suppliers = Supplier.all
  erb(:"suppliers/index")
end

get '/suppliers/new' do
  @suppliers = Supplier.all()
  erb(:"suppliers/new")
end

get "/suppliers/:id" do
  @supplier = Supplier.find(params[:id].to_i)
  erb(:"suppliers/show")
end

post '/suppliers' do
  @supplier = Supplier.new(params)
  @Supplier.save()
  redirect to "/suppliers/#{@supplier.id}"
end

post "/suppliers/:id" do
  supplier = Supplier.new(params)
  supplier.update()
  redirect to "/suppliers/#{params['id']}"
end

get '/suppliers/:id/edit' do
  @supplier = Supplier.find(params[:id])
  @suppliers = Supplier.all()
  erb(:"suppliers/edit")
end
