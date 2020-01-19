require 'rails_helper'

RSpec.describe Api::V1::AmazonCloudFrontController, type: :controller do
  let(:valid_attributes) do
    { description: '$0.00005001 per Lambda-GB-Second for  in US East (N. Virginia)', begin_range: '0', end_range: 'Inf', unit: 'Lambda-GB-Second', price_per_unit: 0.00005001, effective_date: '2019-12-01' }
  end

  let(:valid_session) { {} }

  describe 'GET #amazon_cloud_front/region/:id' do
    it 'returns a success response' do
      AwsCloudFrontPrice.where('region_code=? ', 'us-east-1' )
      
      get :price_by_region, params: { region_code: 'us-east-1' }
      expect(response).to be_successful
     
    end
  end
end
