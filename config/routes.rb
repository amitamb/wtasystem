Wtasystem::Application.routes.draw do
resources :actnotes, :managements, :contracts, :messages
devise_for :users, :controllers => {:sessions => 'devise/sessions'}, :skip => [:sessions] do
                 get 'signin' => 'devise/sessions#new', :as => :new_user_session
                 post 'signin' => 'devise/sessions#create', :as => :user_session
                 get 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session
               end
resources :users
   root :to => "contracts#index"
   match '/confirmjob', :to => "contracts#confirmjob"
   match '/otheracts', :to => "contracts#otheracts"
   match '/import', :to => "contracts#import_contracts"
   #match '/otheracts/*actcode', :to => "contracts#otheracts"
   match '/users/:id'  => "users#edit"
end
