Rails.application.routes.draw do
  root "willsdata#index"
  get "/willsdata", to: "willsdata#index"
end
