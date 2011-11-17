class User

  include MongoMapper::EmbeddedDocument

  key :twitter_id, Integer
  key :screen_name, String
  key :profile_image_url, String
  key :followers_count, Integer
  key :friends_count, Integer

end