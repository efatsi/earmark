Earmark::Application.routes.draw do
  root to: 'marks#index'
  resources :goals
  resources :marks
end
