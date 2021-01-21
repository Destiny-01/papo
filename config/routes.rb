Rails.application.routes.draw do
  resources :shops, path: 'shots' do
    resources :comments
    member do
      put 'like' => 'shops#like'
      put 'unlike' => 'shops#unlike'
    end
  end
  devise_for :users, controllers: { registrations: 'registrations' }, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout', :sign_up => 'sign_up', :edit => 'edit_profile'}
  root 'shops#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
