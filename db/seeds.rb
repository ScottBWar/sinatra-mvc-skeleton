state_cap_deck = Deck.create(:name => 'State Capitals')
state_abrev_deck = Deck.create(:name => 'State Abbreviations')
state_big_city_deck = Deck.create(:name => 'Biggest Cities by State')
world_cap_deck = Deck.create(:name => 'World Capitals')
celeb_name_deck = Deck.create(:name => 'Celebrity Real Names')

state_cap_file = APP_ROOT.join('public', 'StateCaps.csv')
state_abrev_file = APP_ROOT.join('public', 'StateAbrev.csv')
state_big_city_file = APP_ROOT.join('public', 'StateBigCity.csv')
world_cap_file = APP_ROOT.join('public', 'WorldCaps.csv')
celeb_name_file = APP_ROOT.join('public', 'CelebrityNames.csv')

# Card.create([
#   {question: "New York",  answer: "Albany", deck_id: 1},
#   {question: "New Jersey",  answer: "Trenton", deck_id: 1 },
#   {question: "Florida",   answer: "Tallahassee", deck_id: 1 },
#   {question: "California",  answer: "Sacramento", deck_id: 2 },
#   {question: "Nebraska",   answer: "Lincoln", deck_id: 2 },
# ])

User.create([{:name => "Person", :password => '123'},
  {:name => "Scott", :password => '123'},
  {:name => "Nikolai", :password => '123'},
  {:name => "Ari", :password => '123'}])

require 'csv'

CSV.foreach(state_cap_file, :headers => true) do |row|
  Card.create({question: row['state'], answer: row['capital'], deck_id: state_cap_deck.id})
end
CSV.foreach(state_abrev_file, :headers => true) do |row|
  Card.create({question: row['state'], answer: row['abbreviation'], deck_id: state_abrev_deck.id})
end
CSV.foreach(state_big_city_file, :headers => true) do |row|
  Card.create({question: row['state'], answer: row['most_populous_city'], deck_id: state_big_city_deck.id})
end
CSV.foreach(world_cap_file, :headers => true) do |row|
  Card.create({question: row['country'], answer: row['capital'], deck_id: world_cap_deck.id})
end
CSV.foreach(celeb_name_file, :headers => true) do |row|
  Card.create({question: row['real_name'], answer: row['stage_name'], deck_id: celeb_name_deck.id})
end
