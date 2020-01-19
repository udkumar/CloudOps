# Prerequisite
* rails 5 +
* ruby 2.5+
* postgressql 10+

## Fetch the Amazon CLoudFront On-Demand pricing from below URL"
["CLoudFront On-Demand pricing"]("https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonCloudFront/current/index.json")

>> Fetching data and saving in database daily at midnight. Saving only unique data. For fetching data I added services and worker and worker is calling by scheduler.


