require 'test_helper'

class Api::V1::AmazonCloudFrontControllerTest < ActionDispatch::IntegrationTest
  test 'should get region' do
    get api_v1_amazon_cloud_front_region_url
    assert_response :success
  end
end
