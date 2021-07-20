Spree::Core::Engine.add_routes do
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :tags, only: :index
    end
  end
end
