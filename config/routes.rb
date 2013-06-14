YetAnotherKardAchievements::Application.routes.draw do
  get :home, to: "pages#home", as: 'home'

  root to: "pages#home"
  post :checkin, to: "resources#checkin", format: :json, as: :checkin


end
