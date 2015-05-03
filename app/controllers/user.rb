get '/user/new' do
  erb :"user/new"
end


post '/user/new' do
 new_user = User.new(name: params[:name], password: params[:password])
 new_user.save
 redirect "/"
end
