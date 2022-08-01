Rails.application.routes.draw do
  scope "(:locale)",
        locale: /#{I18n.available_locales.join("|")}/ do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'welcome/contactus'
  get 'welcome/suit'
  get 'welcome/blazzer'
  get 'welcome/signin_signup'
  resources :clients
  resources :users
  get 'login', to: 'logins#new'
  post 'login', to: 'logins#create'
  delete 'logout', to: 'logins#destroy'
  end

  root 'welcome#home'
  get 'welcome/about'

end
