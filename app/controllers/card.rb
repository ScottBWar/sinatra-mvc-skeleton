get "/deck/:deckid/card/new" do
 erb :"card/new" ,locals: {deck_id: params[:deckid]}
end

post "/deck/:deckid/card" do
  new_card = Card.new(question: params[:question], answer: params[:answer], deck_id: params[:deckid])
  new_card.save
   redirect "/deck/#{params[:deckid]}/card/new"


end
