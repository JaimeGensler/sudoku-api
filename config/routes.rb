Rails.application.routes.draw do
    get 'grids/random', to: 'grids#random'
    resources :grids
end
