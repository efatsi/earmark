Earmark::Application.routes.draw do
  root to: 'application#show'

  scope :api do
    resources :marks
    put '/transfer_marks' => 'marks#update'
    get '/goals' => 'goals#show'
    resources :goals
  end
end
