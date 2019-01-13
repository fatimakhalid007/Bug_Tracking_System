Rails.application.routes.draw do
  resources :projects
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources:users
	resources:sessions
	match '/signup',  to: 'users#new', via: 'get'
	match '/signin',  to: 'sessions#new', via: 'get'
	match 'signout',  to:  'sessions#destroy', via:'get'
	root 'pages#home'
	match 'signout',  to:  'sessions#destroy', via:'get'
	match '/developers', to: 'users#developers', as: 'developers',via: 'get'
	match '/quas', to: 'users#quas', as: 'quas',via: 'get'

	match '/assignProject/:id', to: 'projects#assignProject', as: 'assignProject',via: ['get','patch','put']
	match '/unAssignProject', to: 'projects#unAssignProject', as: 'unAssignProject',via: 'get'




end


