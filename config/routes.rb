Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home', to: 'welcome#home'
  get 'welcome/about'
  get 'welcome/contactus'
  get 'welcome/suit'
  get 'welcome/blazzer'
  resources :clients
  resources :users
  get 'login', to: 'logins#new'
  post 'login', to: 'logins#create'
  delete 'logout', to: 'logins#destroy'
  end
end
