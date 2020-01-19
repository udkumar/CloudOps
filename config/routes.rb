Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'amazon_cloud_front/region/:id' => 'amazon_cloud_front#price_by_region'
      get 'amazon_cloud_front/sync_aws_cf_data'
    end
  end
end
