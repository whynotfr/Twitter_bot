require 'twitter'
 
stream = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = "WBj8wrY3i28Ewk2xvFxDaAnfh"
  config.consumer_secret     = "5duu7sZhZVSrZwnPJYD0somjwzfDro5lRMVt08Mdd2EsCnM1XN"
  config.access_token        = "834396304361082880-21mnXFTdQym4TTPjuaINM6M4LUa2suX"
  config.access_token_secret = "WN9FR24ZOVMkjoNQn63zCbV0ur6KoU0IlJKucYNPexhvB"
end
rest = Twitter::REST::Client.new do |config|
  config.consumer_key        = "WBj8wrY3i28Ewk2xvFxDaAnfh"
  config.consumer_secret     = "5duu7sZhZVSrZwnPJYD0somjwzfDro5lRMVt08Mdd2EsCnM1XN"
  config.access_token        = "834396304361082880-21mnXFTdQym4TTPjuaINM6M4LUa2suX"
  config.access_token_secret = "WN9FR24ZOVMkjoNQn63zCbV0ur6KoU0IlJKucYNPexhvB"
end


topics = ["an email", "un email", " '@gmail.com' "]
stream.filter(track: topics.join(",")) do |object| 
  if object.full_text.include? "RT"
    p non
  else
	rest.favorite(object.id)
	p object.full_text + " " + object.user.location
end
end

