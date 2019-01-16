Rails.application.routes.draw do
   resources:bugs
   resources:projects
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources:users
	resources:sessions
	match '/signup',  to: 'users#new', via: 'get'
	match '/signin',  to: 'sessions#new', via: 'get'
	match '/signout',  to:  'sessions#destroy', via:'get'
	root 'pages#home'
	match 'signout',  to:  'sessions#destroy', via:'get'
	match '/developers', to: 'users#developers', as: 'developers',via: 'get'
	match '/quas', to: 'users#quas', as: 'quas',via: 'get'
    match '/projectBugs/:id', to: 'projects#projectBugs', as: 'projectBugs',via: 'get'
    match '/qaBugs/:id', to:'projects#qaBugs', as:'qaBugs',via:'get'

    match '/developerBugs/:id', to:'projects#developerBugs', as:'developerBugs',via:'get'

	match '/assignProject/:id', to: 'projects#assignProject', as: 'assignProject',via: ['get','patch','put']
	match '/unAssignProject', to: 'projects#unAssignProject', as: 'unAssignProject',via: 'get'

	match '/allfeatures', to: 'bugs#allfeatures', as: 'allfeatures',via: ['get']
	match '/allbugs', to: 'bugs#allbugs', as: 'allbugs',via: ['get']

	match '/assign', to: 'projects#assign', as: 'assign',via: 'get'
	match '/unAssign', to: 'projects#unAssign', as: 'unAssign',via: 'get'

	match '/assignBugs', to: 'bugs#assignBugs', as: 'assignBugs',via: ['get']
	match '/inprogressBugs', to: 'bugs#inprogressBugs', as: 'inprogressBugs',via: ['get']
	match '/newbug', to: 'bugs#newbug', as: 'newbug',via: ['get']
	match '/resolvedBugs', to: 'bugs#resolvedBugs', as: 'resolvedBugs',via: ['get']
	match '/unAssignBugs', to: 'bugs#unAssignBugs', as: 'unAssignBugs',via: ['get']
	match '/unresolvedBugs', to: 'bugs#unresolvedBugs', as: 'unresolvedBugs',via: ['get']

	match '/assignfeature', to: 'bugs#assignfeature', as: 'assignfeature',via: ['get']
	match '/inprogressfeature', to: 'bugs#inprogressfeature', as: 'inprogressfeature',via: ['get']
	match '/newfeature', to: 'bugs#newfeature', as: 'newfeature',via: ['get']
	match '/resolvedfeature', to: 'bugs#resolvedfeature', as: 'resolvedfeature',via: ['get']
	match '/unAssignfeature', to: 'bugs#unAssignfeature', as: 'unAssignfeature',via: ['get']
	match '/unresolvedfeature', to: 'bugs#unresolvedfeature', as: 'unresolvedfeature',via: ['get']

	match '/search', to: 'pages#search', as: 'search', via:['get','post']

	match '/developersfeature/:id', to: 'bugs#developersfeature', as: 'developersfeature',via: ['get']
	match '/developersbugs/:id', to: 'bugs#developersbugs', as: 'developersbugs',via: ['get']
	match '/developersresolved:id', to: 'bugs#developersresolved', as: 'developersresolved',via: ['get']

	match '/developersprojects/:id',to:'bugs#developersprojects',as:'developersprojects',via:['get']

    match '/qabugsfeatures/:id', to: 'bugs#qabugsfeatures', as: 'qabugsfeatures',via: ['get']

    match '/all_project_features/:id', to: 'bugs#all_project_features', as: 'all_project_features',via: ['get']
	match '/all_project_bugs/:id', to: 'bugs#all_project_bugs', as: 'all_project_bugs',via: ['get']

	match '/qaresolvedbugs/:id', to: 'bugs#qaresolvedbugs', as: 'qaresolvedbugs',via: ['get']
	match '/qaunresolvedbugs/:id', to: 'bugs#qaunresolvedbugs', as: 'qaunresolvedbugs',via: ['get']
	match '/qanewbugs/:id', to: 'bugs#qanewbugs', as: 'qanewbugs',via: ['get']
	match '/qainprogressbugs/:id', to: 'bugs#qainprogressbugs', as: 'qainprogressbugs',via: ['get']



end


