get '/deck/new' do
  erb :"deck/new"
end

post '/deck/new' do
 deck_1 = Deck.new(name: params[:name])
 deck_1.save
 redirect "/deck/#{deck_1.id}/card/new"
end
