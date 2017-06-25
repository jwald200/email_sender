Rails.application.routes.draw do
  resource :email, only: [:new, :create]
end
