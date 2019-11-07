Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root :to => 'codes#index'

devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}

get 'users/admins_index' => 'users#admins_index', as:'users_admins'
patch 'users/admins/deleted/:id' => 'users#admins_deleted_flag', as:'admins_deleted_flag'
resources :users, only: [:update, :show, :edit, :destroy]

get 'codes/admins_index' => 'codes#admins_index', as:'codes_admins'
get 'codes/admins/:id' => 'codes#admins_show', as:'code_admins'
patch 'codes/admins_delete/:id' => 'codes#admins_destroy', as:'code_admins_destroy'
resources :codes, only: [:show, :new, :edit, :create, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resource :comments, only: [:create, :destroy]
end

resources :tags, only: [:create, :update]

resources :codetags, only: [:create, :update]

resources :contacts, only: [:index, :create, :destroy]

end
