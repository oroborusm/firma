Rails.application.routes.draw do
  resources :usuarios do
    collection do
      post :import
    end
  end

  root "usuarios#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
