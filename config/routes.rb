Rails.application.routes.draw do
  get '/check_password' => 'password#check'
end
