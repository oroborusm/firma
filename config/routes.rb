Rails.application.routes.draw do
  devise_for :admins
  get 'search/create'

  resources :usuarios do
    member do
      post :enviar
    end
    collection do
      post :import
    end
  end

  root "usuarios#index"
end
