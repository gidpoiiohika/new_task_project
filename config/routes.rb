Rails.application.routes.draw do
  devise_for :users, skip: [:sessions, :registrations ], controllers: { sessions: 'sessions' }

  devise_scope :user do
    root to: 'tasks#index'
  end

  as :user do
    get    'login'    =>  'devise/sessions#new',         as: :new_user_session
    post   'login'    =>  'devise/sessions#create',      as: :user_session
    delete 'logout'   =>  'devise/sessions#destroy',     as: :destroy_user_session
    post   'users'    =>  'devise/registrations#create', as: :user_registration
    get    'register' =>  'devise/registrations#new',    as: :new_user_registration
  end

  resources :tasks, only: [:index, :new, :create, :edit, :update] do
    member { 
      get :soft_delete
      get "versions", to: "tasks#versions"
    }
  end
end
