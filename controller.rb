require 'sinatra'
require 'sinatra/contrib/all' if development?
require 'json'

require_relative 'models/preorder.rb'

get '/admin' do
  @orders = PreOrder.all
  erb(:admin)
end

get '/' do
  erb(:landing_page)
end

get '/confirmation' do
  erb(:confirmation_page)
end

post '/' do
  @order = PreOrder.new(params)
  @order.save
  erb(:landing_page)
end
