require 'spec_helper'

describe Player do
  before do
    Player.destroy_all
    TweetMessage.destroy_all
    @tweet = {:id_str=>"136400368350400512", :geo=>nil, :text=>"thisisateststringthatneedstoberetweeted", :in_reply_to_user_id=>nil, :in_reply_to_status_id=>nil, :favorited=>false, :coordinates=>nil, :truncated=>false, :entities=>{:hashtags=>[], :urls=>[], :user_mentions=>[]}, :retweet_count=>0, :in_reply_to_screen_name=>nil, :source=>"web", :place=>nil, :retweeted=>false, :in_reply_to_status_id_str=>nil, :in_reply_to_user_id_str=>nil, :user=>{:id_str=>"14410823", :profile_text_color=>"333333", :screen_name=>"mooktakim", :show_all_inline_media=>false, :profile_background_image_url=>"http://a0.twimg.com/images/themes/theme1/bg.png", :favourites_count=>1, :url=>"http://www.mooktakim.com", :profile_link_color=>"0084B4", :time_zone=>"London", :description=>"", :is_translator=>false, :follow_request_sent=>nil, :lang=>"en", :profile_background_image_url_https=>"https://si0.twimg.com/images/themes/theme1/bg.png", :friends_count=>142, :profile_background_color=>"C0DEED", :location=>"London, UK", :default_profile=>true, :listed_count=>1, :geo_enabled=>false, :notifications=>nil, :profile_background_tile=>false, :profile_sidebar_fill_color=>"DDEEF6", :statuses_count=>484, :following=>nil, :protected=>false, :profile_sidebar_border_color=>"C0DEED", :followers_count=>119, :profile_image_url=>"http://a0.twimg.com/profile_images/1300630718/35626_841235311145_61413123_48949478_532660_n_normal.jpg", :name=>"Mooktakim Ahmed", :default_profile_image=>false, :created_at=>"Wed Apr 16 17:58:33 +0000 2008", :profile_image_url_https=>"https://si0.twimg.com/profile_images/1300630718/35626_841235311145_61413123_48949478_532660_n_normal.jpg", :id=>14410823, :contributors_enabled=>false, :verified=>false, :profile_use_background_image=>true, :utc_offset=>0}, :id=>136400368350400512, :created_at=>"Tue Nov 15 11:09:16 +0000 2011", :contributors=>nil}
    @retweet = {:id_str=>"136402007593467905", :geo=>nil, :text=>"RT @mooktakim: thisisateststringthatneedstoberetweeted", :retweeted_status=>{:id_str=>"136400368350400512", :geo=>nil, :text=>"thisisateststringthatneedstoberetweeted", :in_reply_to_user_id=>nil, :in_reply_to_status_id=>nil, :favorited=>false, :coordinates=>nil, :truncated=>false, :entities=>{:hashtags=>[], :urls=>[], :user_mentions=>[]}, :retweet_count=>0, :in_reply_to_screen_name=>nil, :source=>"web", :place=>nil, :retweeted=>false, :in_reply_to_status_id_str=>nil, :in_reply_to_user_id_str=>nil, :user=>{:id_str=>"14410823", :profile_text_color=>"333333", :screen_name=>"mooktakim", :show_all_inline_media=>false, :profile_background_image_url=>"http://a0.twimg.com/images/themes/theme1/bg.png", :favourites_count=>1, :url=>"http://www.mooktakim.com", :profile_link_color=>"0084B4", :default_profile=>true, :time_zone=>"London", :description=>"", :is_translator=>false, :follow_request_sent=>nil, :lang=>"en", :profile_background_image_url_https=>"https://si0.twimg.com/images/themes/theme1/bg.png", :friends_count=>142, :profile_background_color=>"C0DEED", :location=>"London, UK", :listed_count=>1, :geo_enabled=>false, :notifications=>nil, :profile_background_tile=>false, :profile_sidebar_fill_color=>"DDEEF6", :statuses_count=>484, :following=>nil, :protected=>false, :profile_sidebar_border_color=>"C0DEED", :followers_count=>119, :profile_image_url=>"http://a0.twimg.com/profile_images/1300630718/35626_841235311145_61413123_48949478_532660_n_normal.jpg", :name=>"Mooktakim Ahmed", :default_profile_image=>false, :created_at=>"Wed Apr 16 17:58:33 +0000 2008", :profile_image_url_https=>"https://si0.twimg.com/profile_images/1300630718/35626_841235311145_61413123_48949478_532660_n_normal.jpg", :id=>14410823, :contributors_enabled=>false, :verified=>false, :profile_use_background_image=>true, :utc_offset=>0}, :id=>136400368350400512, :created_at=>"Tue Nov 15 11:09:16 +0000 2011", :contributors=>nil}, :in_reply_to_user_id=>nil, :in_reply_to_status_id=>nil, :favorited=>false, :coordinates=>nil, :truncated=>false, :entities=>{:hashtags=>[], :urls=>[], :user_mentions=>[{"screen_name"=>"mooktakim", "id_str"=>"14410823", "indices"=>[3, 13], "name"=>"Mooktakim Ahmed", "id"=>14410823}]}, :retweet_count=>0, :in_reply_to_screen_name=>nil, :source=>"web", :place=>nil, :retweeted=>false, :in_reply_to_status_id_str=>nil, :in_reply_to_user_id_str=>nil, :user=>{:id_str=>"27207254", :profile_text_color=>"333333", :screen_name=>"vispatel", :show_all_inline_media=>false, :profile_background_image_url=>"http://a0.twimg.com/images/themes/theme1/bg.png", :favourites_count=>12, :url=>nil, :profile_link_color=>"0084B4", :default_profile=>true, :time_zone=>"London", :description=>nil, :is_translator=>false, :follow_request_sent=>nil, :lang=>"en", :profile_background_image_url_https=>"https://si0.twimg.com/images/themes/theme1/bg.png", :friends_count=>45, :profile_background_color=>"C0DEED", :location=>nil, :listed_count=>0, :geo_enabled=>false, :notifications=>nil, :profile_background_tile=>false, :profile_sidebar_fill_color=>"DDEEF6", :statuses_count=>26, :following=>nil, :protected=>false, :profile_sidebar_border_color=>"C0DEED", :followers_count=>18, :profile_image_url=>"http://a2.twimg.com/profile_images/1486792022/image_normal.jpg", :name=>"Vishal Patel", :default_profile_image=>false, :created_at=>"Sat Mar 28 10:10:48 +0000 2009", :profile_image_url_https=>"https://si0.twimg.com/profile_images/1486792022/image_normal.jpg", :id=>27207254, :contributors_enabled=>false, :verified=>false, :profile_use_background_image=>true, :utc_offset=>0}, :id=>136402007593467905, :created_at=>"Tue Nov 15 11:15:47 +0000 2011", :contributors=>nil}
    @retweet_of_retweet = {:id_str=>"136404677020491776", :geo=>nil, :text=>"RT @mooktakim: thisisateststringthatneedstoberetweeted", :retweeted_status=>{:id_str=>"136400368350400512", :geo=>nil, :text=>"thisisateststringthatneedstoberetweeted", :in_reply_to_user_id=>nil, :in_reply_to_status_id=>nil, :favorited=>false, :coordinates=>nil, :truncated=>false, :entities=>{:hashtags=>[], :urls=>[], :user_mentions=>[]}, :retweet_count=>1, :in_reply_to_screen_name=>nil, :source=>"web", :place=>nil, :retweeted=>false, :in_reply_to_status_id_str=>nil, :in_reply_to_user_id_str=>nil, :user=>{:id_str=>"14410823", :profile_text_color=>"333333", :screen_name=>"mooktakim", :show_all_inline_media=>false, :profile_background_image_url=>"http://a0.twimg.com/images/themes/theme1/bg.png", :favourites_count=>1, :url=>"http://www.mooktakim.com", :profile_link_color=>"0084B4", :time_zone=>"London", :description=>"", :is_translator=>false, :follow_request_sent=>nil, :lang=>"en", :profile_background_image_url_https=>"https://si0.twimg.com/images/themes/theme1/bg.png", :friends_count=>142, :profile_background_color=>"C0DEED", :location=>"London, UK", :listed_count=>1, :geo_enabled=>false, :notifications=>nil, :profile_background_tile=>false, :profile_sidebar_fill_color=>"DDEEF6", :default_profile=>true, :statuses_count=>484, :following=>nil, :protected=>false, :profile_sidebar_border_color=>"C0DEED", :followers_count=>119, :profile_image_url=>"http://a0.twimg.com/profile_images/1300630718/35626_841235311145_61413123_48949478_532660_n_normal.jpg", :name=>"Mooktakim Ahmed", :default_profile_image=>false, :created_at=>"Wed Apr 16 17:58:33 +0000 2008", :profile_image_url_https=>"https://si0.twimg.com/profile_images/1300630718/35626_841235311145_61413123_48949478_532660_n_normal.jpg", :id=>14410823, :contributors_enabled=>false, :verified=>false, :profile_use_background_image=>true, :utc_offset=>0}, :id=>136400368350400512, :created_at=>"Tue Nov 15 11:09:16 +0000 2011", :contributors=>nil}, :in_reply_to_user_id=>nil, :in_reply_to_status_id=>nil, :favorited=>false, :coordinates=>nil, :truncated=>false, :entities=>{:hashtags=>[], :urls=>[], :user_mentions=>[{"screen_name"=>"mooktakim", "id_str"=>"14410823", "indices"=>[3, 13], "name"=>"Mooktakim Ahmed", "id"=>14410823}]}, :retweet_count=>1, :in_reply_to_screen_name=>nil, :source=>"<a href=\"http://www.handmark.com\" rel=\"nofollow\">TweetCaster for iOS</a>", :place=>nil, :retweeted=>false, :in_reply_to_status_id_str=>nil, :in_reply_to_user_id_str=>nil, :user=>{:id_str=>"18461842", :profile_text_color=>"333333", :screen_name=>"sherrry", :show_all_inline_media=>false, :profile_background_image_url=>"http://a0.twimg.com/images/themes/theme1/bg.png", :favourites_count=>1, :url=>nil, :profile_link_color=>"0084B4", :time_zone=>nil, :description=>nil, :is_translator=>false, :follow_request_sent=>nil, :lang=>"en", :profile_background_image_url_https=>"https://si0.twimg.com/images/themes/theme1/bg.png", :friends_count=>5, :profile_background_color=>"C0DEED", :location=>nil, :listed_count=>0, :geo_enabled=>false, :notifications=>nil, :profile_background_tile=>false, :profile_sidebar_fill_color=>"DDEEF6", :default_profile=>true, :statuses_count=>3, :following=>nil, :protected=>false, :profile_sidebar_border_color=>"C0DEED", :followers_count=>8, :profile_image_url=>"http://a3.twimg.com/sticky/default_profile_images/default_profile_0_normal.png", :name=>"sherrry", :default_profile_image=>true, :created_at=>"Mon Dec 29 22:25:48 +0000 2008", :profile_image_url_https=>"https://si0.twimg.com/sticky/default_profile_images/default_profile_0_normal.png", :id=>18461842, :contributors_enabled=>false, :verified=>false, :profile_use_background_image=>true, :utc_offset=>nil}, :id=>136404677020491776, :created_at=>"Tue Nov 15 11:26:23 +0000 2011", :contributors=>nil}
    @tweet_with_url = {:id_str=>"136414642795851776", :geo=>nil, :text=>"#restless Human Writes 2 http://t.co/syCvRVcT via @restlessbeings", :in_reply_to_user_id=>nil, :in_reply_to_status_id=>nil, :favorited=>false, :coordinates=>nil, :truncated=>false, :possibly_sensitive=>false, :entities=>{:hashtags=>[{"text"=>"restless", "indices"=>[0, 9]}], :urls=>[{"indices"=>[25, 45], "url"=>"http://t.co/syCvRVcT", "expanded_url"=>"http://www.restlessbeings.org/events/human-writes-2", "display_url"=>"restlessbeings.org/events/human-w..."}], :user_mentions=>[{"screen_name"=>"RestlessBeings", "id_str"=>"18761258", "indices"=>[50, 65], "name"=>"Restless Beings", "id"=>18761258}]}, :retweet_count=>0, :in_reply_to_screen_name=>nil, :source=>"<a href=\"http://twitter.com/tweetbutton\" rel=\"nofollow\">Tweet Button</a>", :place=>nil, :retweeted=>false, :in_reply_to_status_id_str=>nil, :in_reply_to_user_id_str=>nil, :user=>{:id_str=>"14410823", :profile_text_color=>"333333", :screen_name=>"mooktakim", :show_all_inline_media=>false, :profile_background_image_url=>"http://a0.twimg.com/images/themes/theme1/bg.png", :favourites_count=>1, :url=>"http://www.mooktakim.com", :profile_link_color=>"0084B4", :time_zone=>"London", :description=>"", :is_translator=>false, :follow_request_sent=>nil, :lang=>"en", :profile_background_image_url_https=>"https://si0.twimg.com/images/themes/theme1/bg.png", :friends_count=>142, :profile_background_color=>"C0DEED", :location=>"London, UK", :listed_count=>1, :geo_enabled=>false, :notifications=>nil, :profile_background_tile=>false, :profile_sidebar_fill_color=>"DDEEF6", :default_profile=>true, :statuses_count=>486, :following=>nil, :protected=>false, :profile_sidebar_border_color=>"C0DEED", :followers_count=>119, :profile_image_url=>"http://a0.twimg.com/profile_images/1300630718/35626_841235311145_61413123_48949478_532660_n_normal.jpg", :name=>"Mooktakim Ahmed", :default_profile_image=>false, :created_at=>"Wed Apr 16 17:58:33 +0000 2008", :profile_image_url_https=>"https://si0.twimg.com/profile_images/1300630718/35626_841235311145_61413123_48949478_532660_n_normal.jpg", :id=>14410823, :contributors_enabled=>false, :verified=>false, :profile_use_background_image=>true, :utc_offset=>0}, :id=>136414642795851776, :created_at=>"Tue Nov 15 12:05:59 +0000 2011", :contributors=>nil}
    @tweet_with_image = {:id_str=>"136414642795851777", :geo=>nil, :text=>"#restless Human Writes 2 http://t.co/XyS3hKmf via @restlessbeings", :in_reply_to_user_id=>nil, :in_reply_to_status_id=>nil, :favorited=>false, :coordinates=>nil, :truncated=>false, :possibly_sensitive=>false, :entities=>{:hashtags=>[{"text"=>"restless", "indices"=>[0, 9]}], :urls=>[{"indices"=>[25, 45], "url"=>"http://t.co/XyS3hKmf", "expanded_url"=>"http://t.co/XyS3hKmf", "display_url"=>"t.co/XyS3hKmf"}], :user_mentions=>[{"screen_name"=>"RestlessBeings", "id_str"=>"18761258", "indices"=>[50, 65], "name"=>"Restless Beings", "id"=>18761258}]}, :retweet_count=>0, :in_reply_to_screen_name=>nil, :source=>"<a href=\"http://twitter.com/tweetbutton\" rel=\"nofollow\">Tweet Button</a>", :place=>nil, :retweeted=>false, :in_reply_to_status_id_str=>nil, :in_reply_to_user_id_str=>nil, :user=>{:id_str=>"14410823", :profile_text_color=>"333333", :screen_name=>"mooktakim", :show_all_inline_media=>false, :profile_background_image_url=>"http://a0.twimg.com/images/themes/theme1/bg.png", :favourites_count=>1, :url=>"http://www.mooktakim.com", :profile_link_color=>"0084B4", :time_zone=>"London", :description=>"", :is_translator=>false, :follow_request_sent=>nil, :lang=>"en", :profile_background_image_url_https=>"https://si0.twimg.com/images/themes/theme1/bg.png", :friends_count=>142, :profile_background_color=>"C0DEED", :location=>"London, UK", :listed_count=>1, :geo_enabled=>false, :notifications=>nil, :profile_background_tile=>false, :profile_sidebar_fill_color=>"DDEEF6", :default_profile=>true, :statuses_count=>486, :following=>nil, :protected=>false, :profile_sidebar_border_color=>"C0DEED", :followers_count=>119, :profile_image_url=>"http://a0.twimg.com/profile_images/1300630718/35626_841235311145_61413123_48949478_532660_n_normal.jpg", :name=>"Mooktakim Ahmed", :default_profile_image=>false, :created_at=>"Wed Apr 16 17:58:33 +0000 2008", :profile_image_url_https=>"https://si0.twimg.com/profile_images/1300630718/35626_841235311145_61413123_48949478_532660_n_normal.jpg", :id=>14410823, :contributors_enabled=>false, :verified=>false, :profile_use_background_image=>true, :utc_offset=>0}, :id=>136414642795851777, :created_at=>"Tue Nov 15 12:05:59 +0000 2011", :contributors=>nil}
    @tweet_with_video = {:id_str=>"136414642795851778", :geo=>nil, :text=>"#restless Human Writes 2 http://vimeo.com/18150336 via @restlessbeings", :in_reply_to_user_id=>nil, :in_reply_to_status_id=>nil, :favorited=>false, :coordinates=>nil, :truncated=>false, :possibly_sensitive=>false, :entities=>{:hashtags=>[{"text"=>"restless", "indices"=>[0, 9]}], :urls=>[{"indices"=>[25, 45], "url"=>"http://vimeo.com/18150336", "expanded_url"=>"http://vimeo.com/18150336", "display_url"=>"vimeo.com/18150336"}], :user_mentions=>[{"screen_name"=>"RestlessBeings", "id_str"=>"18761258", "indices"=>[50, 65], "name"=>"Restless Beings", "id"=>18761258}]}, :retweet_count=>0, :in_reply_to_screen_name=>nil, :source=>"<a href=\"http://twitter.com/tweetbutton\" rel=\"nofollow\">Tweet Button</a>", :place=>nil, :retweeted=>false, :in_reply_to_status_id_str=>nil, :in_reply_to_user_id_str=>nil, :user=>{:id_str=>"14410823", :profile_text_color=>"333333", :screen_name=>"mooktakim", :show_all_inline_media=>false, :profile_background_image_url=>"http://a0.twimg.com/images/themes/theme1/bg.png", :favourites_count=>1, :url=>"http://www.mooktakim.com", :profile_link_color=>"0084B4", :time_zone=>"London", :description=>"", :is_translator=>false, :follow_request_sent=>nil, :lang=>"en", :profile_background_image_url_https=>"https://si0.twimg.com/images/themes/theme1/bg.png", :friends_count=>142, :profile_background_color=>"C0DEED", :location=>"London, UK", :listed_count=>1, :geo_enabled=>false, :notifications=>nil, :profile_background_tile=>false, :profile_sidebar_fill_color=>"DDEEF6", :default_profile=>true, :statuses_count=>486, :following=>nil, :protected=>false, :profile_sidebar_border_color=>"C0DEED", :followers_count=>119, :profile_image_url=>"http://a0.twimg.com/profile_images/1300630718/35626_841235311145_61413123_48949478_532660_n_normal.jpg", :name=>"Mooktakim Ahmed", :default_profile_image=>false, :created_at=>"Wed Apr 16 17:58:33 +0000 2008", :profile_image_url_https=>"https://si0.twimg.com/profile_images/1300630718/35626_841235311145_61413123_48949478_532660_n_normal.jpg", :id=>14410823, :contributors_enabled=>false, :verified=>false, :profile_use_background_image=>true, :utc_offset=>0}, :id=>136414642795851778, :created_at=>"Tue Nov 15 12:05:59 +0000 2011", :contributors=>nil}
  end

  it "should create player with score 1 when new tweet is received" do
    tweet = @tweet
    msg = TweetMessage.create_from_hash(tweet)
    msg.twitter_id.should == tweet[:id]
    msg.user.should_not be_nil
    msg.urls.should be_empty

    player = Player.first(:twitter_id => tweet[:user][:id])
    player.should_not be_nil
    player.screen_name.should == tweet[:user][:screen_name]
    player.profile_image_url.should == tweet[:user][:profile_image_url]

    player.reload
    player.score.should == 1
  end

  it "should create player with score 2 when new tweet with url is received" do
    tweet = @tweet_with_url
    msg = TweetMessage.create_from_hash(tweet)
    msg.twitter_id.should == tweet[:id]
    msg.user.should_not be_nil
    msg.urls.should_not be_empty

    player = Player.first(:twitter_id => tweet[:user][:id])
    player.should_not be_nil
    player.screen_name.should == tweet[:user][:screen_name]
    player.profile_image_url.should == tweet[:user][:profile_image_url]

    player.reload
    player.score.should == 2
  end

  it "should create player with score 5 when new tweet with image is received" do
    tweet = @tweet_with_image
    msg = TweetMessage.create_from_hash(tweet)
    msg.twitter_id.should == tweet[:id]
    msg.user.should_not be_nil
    msg.urls.should_not be_empty

    player = Player.first(:twitter_id => tweet[:user][:id])
    player.should_not be_nil
    player.screen_name.should == tweet[:user][:screen_name]
    player.profile_image_url.should == tweet[:user][:profile_image_url]

    player.reload
    player.score.should == 5
  end

  it "should create player with score 10 when new tweet with video is received" do
    tweet = @tweet_with_video
    msg = TweetMessage.create_from_hash(tweet)
    msg.twitter_id.should == tweet[:id]
    msg.user.should_not be_nil
    msg.urls.should_not be_empty

    player = Player.first(:twitter_id => tweet[:user][:id])
    player.should_not be_nil
    player.screen_name.should == tweet[:user][:screen_name]
    player.profile_image_url.should == tweet[:user][:profile_image_url]

    player.reload
    player.score.should == 10
  end

  it "should add 10 points to player if someone retweets" do
    tweet = @tweet
    msg = TweetMessage.create_from_hash(tweet)
    msg.twitter_id.should == tweet[:id]
    msg.user.should_not be_nil
    msg.urls.should be_empty

    player = Player.first(:twitter_id => tweet[:user][:id])
    player.should_not be_nil
    player.screen_name.should == tweet[:user][:screen_name]
    player.profile_image_url.should == tweet[:user][:profile_image_url]

    player.reload
    player.score.should == 1

    retweet = @retweet
    msg = TweetMessage.create_from_hash(retweet)
    msg.twitter_id.should == retweet[:id]
    msg.user.should_not be_nil
    msg.urls.should be_empty


    player = Player.first(:twitter_id => tweet[:user][:id])
    player.should_not be_nil
    player.screen_name.should == tweet[:user][:screen_name]
    player.profile_image_url.should == tweet[:user][:profile_image_url]

    player.reload
    player.score.should == 11

    retweet = @retweet_of_retweet
    msg = TweetMessage.create_from_hash(retweet)
    msg.twitter_id.should == retweet[:id]
    msg.user.should_not be_nil
    msg.urls.should be_empty


    player = Player.first(:twitter_id => tweet[:user][:id])
    player.should_not be_nil
    player.screen_name.should == tweet[:user][:screen_name]
    player.profile_image_url.should == tweet[:user][:profile_image_url]

    player.reload
    player.score.should == 21
  end
end