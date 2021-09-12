Rails.application.routes.draw do
  
  devise_for :users, path: ""
  devise_for :admins, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
  }


  namespace :public, path: "" do
    root "top#index"


    get 'top/ajax'

    resources :news, only: [:index, :show]
  end

  namespace :company_admin, path: "c_admin" do
    root "top#index"
  end

  namespace :admin do
    root "top#index"
  end

end
