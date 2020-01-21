require 'rails_helper'

RSpec.describe Api::V1::AmazonCloudFrontController, type: :controller do

  before do
    @effective_date1 = Date.parse("2020-01-01")
    @effective_date2 = Date.parse("2020-01-02")
    @ac_front_price1 = FactoryBot.create(:aws_cloud_front_price, {region_code: "us-east-1", effective_date: @effective_date1})
    @ac_front_price2 = FactoryBot.create(:aws_cloud_front_price, {region_code: "us-east-1",meffective_date: @effective_date2})
  end

  describe 'GET /api/v1/amazon_cloud_front/region/:id' do
    context "region exist" do
      it "should success without date" do
        get :price_by_region, params: {id: "us-east-1"}
        expect(response.status).to eq(200)
        json_body = JSON.parse(response.body)
        expect(json_body.count).to eq(2)
        # expect(json_body["TODO"]).to eq("TODO")
        # expect whatever is coming in the response
      end

      it "should success with date" do
        get :price_by_region, params: {id: "us-east-1", date: @effective_date1}
        expect(response.status).to eq(200)
        json_body = JSON.parse(response.body)
        expect(json_body.count).to eq(1)
        # expect(json_body["TODO"]).to eq("TODO")
        # expect whatever is coming in the response
      end
    end

    context "region does not exist" do
      it "should fail" do
        get :price_by_region, params: {id: "us-east-1", date: @effective_date1}
        expect(response.status).to eq(400)
        json_body = JSON.parse(response.body)
        expect(json_body).to eq({"message"=>"Couldn't find AmazonCloudFront with 'id'=us-east-1"})
      end
    end
  end
end