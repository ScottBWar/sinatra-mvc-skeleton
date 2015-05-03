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


def get_average(deck)
  rounds = Round.where(user_id: session[:user_id], deck_id: deck.id)
  right = 0
  total = 0
  rounds.each do |round|
    round.guesses.each do |guess|
      if guess.result == true
        right += 1
      end
    end
    total += round.guesses.count
  end
  if total > 0
    (right.to_f/total.to_f * 100).to_i.to_s + "%"
  end
end
