Rails.application.routes.draw do
  root 'leagues#index'

  # devise_for :league_admins
  get '/secret' => 'team_admin/registrations#new'

  devise_for :league_admins, controllers: { sessions: 'league_admin/sessions', registrations: 'league_admin/registrations' }, :skip => [ :sessions, :passwords ]

  devise_for :team_admins, :skip => [ :sessions, :passwords ], controllers: { sessions: 'team_admin/sessions', registrations: 'team_admin/registrations' }

  devise_scope :league_admin do
    get '/sign_in'    => 'league_admin/sessions#new', :as => :new_league_admin_session
    match '/sign_in'  => 'league_admin/sessions#new', :as => :new_session, via: 'get'
    post 'sign_in'    => 'league_admin/sessions#create', :as => :create_session
    delete 'sign_out' => 'league_admin/sessions#destroy', :as => :destroy_session
    match 'sign_out'  => 'league_admin/sessions#destroy', :as => :destroy_league_admin_session, via: 'delete'
    match 'sign_out'  => 'league_admin/sessions#destroy', :as => :destroy_admin_league_admin_session, via: 'delete'
  end

  namespace :team_admin do
    get '/' => redirect('/team_admin'), as: 'root'
  end

  devise_for :team_admins, :skip => [ :registrations, :passwords ], controllers: { sessions: 'team_admin/sessions', registrations: 'team_admin/registrations' }
  resources :trades, :except => [ :index, :delete ]
  resources :posts, :except => [ :index ]
  resources :games
  resources :players
  resources :teams
  resources :trade_players
  # resources :leagues

  # devise_for :users, controllers: {
  #       sessions: 'users/sessions'
  #     }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
