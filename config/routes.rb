Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'amazon_cloud_front/region/:id' => 'amazon_cloud_front#price_by_region'
    end
  end
end
