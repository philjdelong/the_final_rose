Rails.application.routes.draw do

  get '/bachelorettes/:id', to: "bachelorettes#show"

  get '/contestants/:id', to: "contestants#show"
  get '/bachelorettes/:bachelorette_id/contestants', to: "contestants#index"

  get '/outings/:id', to: "outings#show"
end
