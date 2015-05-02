get '/card/:card_id' do
  if current_user
    guessed_cards = []
    deck = Deck.find(params[:current_deck_id])
    round = Round.find_or_create_by(live: true, deck_id: params[:current_deck_id], user_id: current_user.id)
    Guess.where(id: round.guess_ids).each do |guess|
      guessed_cards << guess.card_id
    end
    card_array = deck.card_ids - guessed_cards
    flash_card = Card.find(card_array.sample)
    erb :"/card/card", locals:{flash_card: flash_card}
  else
    redirect "/"
  end
end

post '/card/:card_id' do
  card = Card.find(params[:card_id])
  round = Round.find_by(live: true, user_id: current_user.id)
  guess = Guess.create(round: round, card_id: params[:card_id], result: (card.answer.downcase == params[:answer].downcase))
  round.guesses << guess
  redirect "/cards/:card_id"
end
