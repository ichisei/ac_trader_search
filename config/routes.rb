Rails.application.routes.draw do

  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
}

  devise_for :traders, skip: [:passwords], controllers: {
  registrations: "trader/registrations",
  sessions: "trader/sessions"
}

  root to: "homes#top"

  scope module: :customer do
    resources :customers, only: [:index, :show]
  end

  scope module: :trader do
    resources :traders, only: [:show, :edit, :update] do
      resources :posts, only: [:new, :create]
    end
    resources :schedules, only: [:index, :create, :destroy]
    resources :areas, only: [:index, :create, :destroy]
    resources :machines, only: [:index, :create, :destroy]
    get "home" => "homes#top", as: 'pro'
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
