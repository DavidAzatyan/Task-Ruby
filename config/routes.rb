Rails.application.routes.draw do
  get 'answers/index'

  	get 'posts/new'
	resources :posts do
		resources :answers
	end
  	root 'posts#index' ,as: 'home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
