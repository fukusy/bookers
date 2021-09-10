Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'homes#top'


  resources :books
  get "books/:id" => "books#show"

  post "books/create" => "books#create"

end
