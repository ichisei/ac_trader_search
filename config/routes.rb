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

  # get 'homes/top'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
