Rails.application.routes.draw do

  root to: "home#index"

  devise_for :users,  :controllers => { :registrations => "users/registrations"}
  devise_scope :user do
    delete 'users/sign_out', to: 'devise/sessions#destroy'
  end

  get 'home/index'

  match "bank/new-transaction" => 'bank#transaction', via: [:post, :get]
  match "bank/history" => 'bank#history', via: [:post, :get]
  match "bank/help" => 'bank#help', via: [:post, :get]

end
