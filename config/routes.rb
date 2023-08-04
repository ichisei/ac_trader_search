Rails.application.routes.draw do

  #管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  #カスタマー用
  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
}
  #業者用
  devise_for :traders, skip: [:passwords], controllers: {
  registrations: "trader/registrations",
  sessions: "trader/sessions"
}

  root to: "homes#top"

  namespace :customer do
    resources :traders, only: [:index, :show]
  end

  scope module: :trader do
    resources :traders, only: [:index, :show, :edit, :update] do
      resources :posts, only: [:new, :create, :destroy]
    end
    resources :schedules, only: [:index, :create, :destroy]
    resources :areas, only: [:index, :create, :destroy, :destroy]
    resources :machines, only: [:index, :create, :destroy]
    get "home" => "homes#top", as: 'pro'
  end

  get "admin/home" => "admin/homes#top", as: 'admin'
  namespace :admin do
    resources :traders, only: [:index, :show]
    resources :customers, only: [:index]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
