Rails.application.routes.draw do
resources :songs, only: [:index, :show, :new, :edit, :create, :update]
delete '/songs/:id', to: 'songs#destroy', as:'remove_song'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
