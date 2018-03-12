require 'twitter'
require 'dotenv'
Dotenv.load

stream = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = "eyjKflnzoBx6vJiu1W0RPTmsv"
  config.consumer_secret     = "OoUr1OSGNpprMCdSqbdGjGIWery4q9TX9ho5MIRauRtqiYN1K6"
  config.access_token        = "3096975917-EyzBZ7H3anZ1GC5Y6JwGeglgIIU4VCYTEPJB7wK"
  config.access_token_secret = "lbb61UVKo0fLcZmJRR6tcQkd9G7PnDYMqOm798yDursvh"
end
rest = Twitter::REST::Client.new do |config|
  config.consumer_key        = "eyjKflnzoBx6vJiu1W0RPTmsv"
  config.consumer_secret     = "OoUr1OSGNpprMCdSqbdGjGIWery4q9TX9ho5MIRauRtqiYN1K6"
  config.access_token        = "3096975917-EyzBZ7H3anZ1GC5Y6JwGeglgIIU4VCYTEPJB7wK"
  config.access_token_secret = "lbb61UVKo0fLcZmJRR6tcQkd9G7PnDYMqOm798yDursvh"
end


topics = ["edtech", "formation professionnelle", "peer-learning", "apprendre à coder","apprendre la programmation"]
localisation = []
begin
stream.filter(track: topics.join(",")) do |object| 
 

        rest.favorite(object.id)
        p object.full_text + " " + object.user.location
      
end
rescue Exception => msg  
  # display the system generated error message  
  puts msg  
end  

