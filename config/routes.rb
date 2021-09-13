Rails.application.routes.draw do
  
  # devise関連
  devise_for :users, path: "", controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  devise_for :company_admins, path: "c_admin", controllers: {
    sessions: 'company_admin/sessions',
    passwords: 'company_admin/passwords',
    registrations: 'company_admin/registrations'
  }
  
  devise_for :admins, path: "admin", controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
  }

  # main
  namespace :public, path: "" do
    root "top#index"

    get 'top/ajax'

    resources :news, only: [:index, :show]
    
    get ':login_id/mypage' => 'users#mypage', param: :login_id, as: :mypage
    resources :users, param: :login_id, path: "", only: [:show, :update]
  end

  namespace :company_admin, path: "c_admin" do
    root "top#index"
  end

  namespace :admin do
    root "top#index"
  end

end
