### Prerequisite

- Rails 5+
- Ruby 5+
- Postgressql 10+

### System Ability
- Fetch the  Amazon CLoudFront On-Demand price from link [API](https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonCloudFront/current/index.json) daily at midnight
- System will provide one API ``` GET /api/v1/amazon_cloud_front/region/us-east-1```. List of all On-Demand price from given region.
- API has ability to search by date ```/api/v1/amazon_cloud_front/region/us-east-1?date="2019-12-01"```. 
- Syncing only new record in the database from Amazon CLoudFront On-Demand price APIs.

### highlighting which I covered in my code 
- Sync CLoudFront On-Demand in ```services/AwsServices/cloud_front_price_sync_json.rb``` as module.
- Added worker to perform sync and running worker through ```sidekiq-cron``` yml 
- Exception handling and API response handling ```controllers/concerns/*```
- Manual mapping AWS CLoudFront On-Demand in model as function name ```aws_region_mapping```
- Used ```FastJsonApi``` for serializing JSON responses.
