class AwsCloudFrontPrice < ApplicationRecord
	enum source_type: { aws: 0, gcp: 1, azure: 2 }
end
