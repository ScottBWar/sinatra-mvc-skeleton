get '/deck/new' do
  erb :"deck/new"
end

post '/deck/new' do
 deck_1 = Deck.new(name: params[:name])
 deck_1.save
 redirect "/deck/#{deck_1.id}/card/new"
end

get '/deck_select' do
  if current_user
    all_decks = Deck.all
    erb :"/deck/all",  locals: {all_decks: all_decks}
  else
    redirect "/"
  end
end

get "/deck/:deckid/card/new" do
 erb :"card/new" ,locals: {deck_id: params[:deckid]}
end

post "/deck/:deckid/card" do
  new_card = Card.new(question: params[:question], answer: params[:answer], deck_id: params[:deckid])
  new_card.save
   redirect "/deck/#{params[:deckid]}/card/new"
end
