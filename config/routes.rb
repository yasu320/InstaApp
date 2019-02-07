Rails.application.routes.draw do

  devise_scope :user do
    get "/login" => "devise/sessions#new" # custom path to login/sign_in
    get "/signup" => "devise/registrations#new", as: "new_user_registration" # custom path to sign_up/registration
  end

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'},
                      controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static_pages#home'
  get "/rule" => "static_pages#rule"
  get "/users/:id/password/change" => "users#password_change", as: "password_change"
  patch "/users/:id/password/change" => "users#update_password"
  resources :users
  resources :microposts, only: [:create, :destroy, :new]
end
