Rails.application.routes.draw do

	resources :usuarios, as: :users, only: [:show, :update]
	resources :friendships, only:[:create, :update, :index]
    resources :posts do
        resources :comments
    end

	post "/custom_sign_up", to: "users/omniauth_callbacks#custom_sign_up"

	authenticated :user do
		root 'main#home'
	end

	unauthenticated :user do
		root 'main#unregistered'
	end

	devise_for :users, controllers:{
		omniauth_callbacks: "users/omniauth_callbacks"
	}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  	mount ActionCable.server => '/cable'
end
