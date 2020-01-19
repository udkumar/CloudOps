
describe AwsServices::CloudFrontPriceSyncJson do
	
	# AwsServices::CloudFrontPriceSyncJson.new.get_cf_price
  let(:base) { "" }

  it "returns empty data for invalid input" do
    
  end

  it "parses self relation correctly" do
    data = {
      href: "https://api.groovehq.com/v1/agents/matt@groovehq.com"
    }
    
    expect(resource.rels[:self]).to be_instance_of()
  end

end