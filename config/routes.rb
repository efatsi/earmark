Earmark::Application.routes.draw do
  root to: 'application#show'

  scope :api do
    resources :marks
    get '/goals' => 'goals#show'
    resources :goals
  end
end
