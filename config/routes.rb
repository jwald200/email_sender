Rails.application.routes.draw do
  root to: 'emails#new'
  resource :email, only: [:new, :create]
end
