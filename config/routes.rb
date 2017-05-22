Rails.application.routes.draw do
  resources :users do
    collection do
      get 'login'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope 'rest' do
    post '/login', to: 'rest#login'
  end
end
