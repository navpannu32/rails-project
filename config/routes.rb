Rails.application.routes.draw do
  root "layouts#index"

  get '/about', to: 'layouts#about'

end
