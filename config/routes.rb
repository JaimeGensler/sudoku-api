Rails.application.routes.draw do
    namespace :api do
        namespace :v1 do
            get 'grids/random', to: 'grids#random'
            resources :grids
        end
    end
end
