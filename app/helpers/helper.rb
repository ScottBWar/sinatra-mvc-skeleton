def current_user
  if session[:user_id]
    return User.find(session[:user_id])
  else
    return nil
  end
end

def check_answer(guess,card,answer)
  if card.answer == answer
    guess.result = true
    guess
  end
end

def new_round(deck)
  Round.create(user: current_user, deck: deck)
end
