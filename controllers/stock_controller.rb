require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/stock.rb' )
also_reload( '../models/*' )

get '/stocks' do
  @stocks = Stock.all()
  erb ( :"stocks/index" )
end

get '/stocks/:id' do
  @stock = Stock.find(params['id'].to_i)
  erb( :"stocks/show" )
end

post '/stocks/new' do
  @stock =Stock.new(params)
  @stock.save()
  erb(:create)
end
