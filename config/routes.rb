Rails.application.routes.draw do
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources:users
	resources:sessions
	match '/signup',  to: 'users#new', via: 'get'
	match '/signin',  to: 'sessions#new', via: 'get'
	match 'signout',  to:  'sessions#destroy', via:'get'
	root 'pages#home'


end


