Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'homes#top'


  resources :books

  post "books/create" => "books#create"
  get "books/:id" => "books#show"
  get "book/:id/edit" => "book#edit"

end
