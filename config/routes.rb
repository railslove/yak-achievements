YetAnotherKardAchievements::Application.routes.draw do
  root to: "pages#home"

  get :home,              to: "pages#home",   as: :home
  get "status/:yak_uid",  to: "pages#status", as: :status

  post :checkin,          to: "resources#checkin", format: :json, as: :checkin


end
