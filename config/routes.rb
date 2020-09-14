Rails.application.routes.draw do

  resources :cabs, only: :index, defaults: { format: :json } do
      collection do
        post 'book_nearest', to: 'cabs#book_nearest'
      end
  end  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :trips, only: [], defaults: { format: :json } do
    member do
      post 'start'
      post 'end'
    end
  end

end
