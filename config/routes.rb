YetAnotherKardAchievements::Application.routes.draw do
  root to: "resources#checkin", format: :json
  post :checkin, to: "resources#checkin", format: :json, as: :checkin
end
