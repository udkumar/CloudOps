require 'rails_helper'

RSpec.describe Api::V1::AmazonCloudFrontController, type: :controller do

  let!(:aws_cloud_front_prices) { create_list(:aws_cloud_front_price, 10) }
  let(:region_code) { "us-east-1" }
  
  # Test suite for GET /api/v1/amazon_cloud_front/region/:id
  describe 'GET /api/v1/amazon_cloud_front/region/:id' do
    before { get '/api/v1/amazon_cloud_front/region/#{region_code}' }

    context 'when the record exists' do
      it 'returns the amazon_cloud_front' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(region_code)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      
      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match("{\"message\":\"Couldn't find AmazonCloudFront with 'id'=us-east-1\"}")
      end
    end
  end
end
