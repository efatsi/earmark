Earmark::Application.routes.draw do
  root to: 'goals#show'
  resources :goals
  resources :marks

  scope :api do
    resources :marks
  end
end
