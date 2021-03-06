get '/deck/new' do
   if current_user
     erb :"deck/new"
   else
    redirect '/'
   end
end

post '/deck/new' do
 deck_1 = Deck.new(name: params[:name])
 deck_1.save
 redirect "/deck/#{deck_1.id}/card/new"
end

get '/deck/:deckid/edit' do
  if current_user
    deck = Deck.find_by(id: params[:deckid])
    erb :"deck/edit", locals: {deck_id: params[:deck_id], deck_name: deck.name }
  else
    redirect '/'
  end
end

put '/deck/:deckid/edit' do
  value = Deck.find_by(id: params[:deckid])
  value = Deck.update_attributes( name: params[:name])
  redirect "/deck_select"
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
  if current_user
   erb :"card/new" ,locals: {deck_id: params[:deckid]}
  else
    redirect '/'
  end
end

post "/deck/:deckid/card" do
  new_card = Card.new(question: params[:question], answer: params[:answer], deck_id: params[:deckid])
  new_card.save
   redirect "/deck/#{params[:deckid]}/card/new"
end
