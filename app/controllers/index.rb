get '/' do
session['user'] ||= nil

 erb :index
end

post '/' do
  if User.authenticate(params[:name], params[:password]) != 'deny'
    session[:user_id] = User.find_by(name: params[:name]).id

    redirect "/deck_select"
  else
    "[LOG] unauthorized log-in attempt..."
    redirect "/"
  end
  # redirect "/deck_select" if User.find_by(params) != nil
end

get '/logout' do
  session.clear
  redirect "/"
end

