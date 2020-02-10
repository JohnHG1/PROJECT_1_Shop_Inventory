require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/stock.rb' )
also_reload( '../models/*' )

get '/stocks' do
  @stock = Stock.all()
  erb ( :"stock/index" )
end

get '/stocks/:id' do
  @stock = Stock.find(params['id'].to_i)
  erb( :"stock/show" )
end

post '/stocks/new' do
  @stock =Stock.new(params)
  @stock.save()
  erb(:create)
end
