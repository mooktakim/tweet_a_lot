module TweetALot
  class Player

    include MongoMapper::Document

    key :twitter_id, Integer
    key :screen_name, String
    key :profile_image_url, String
    key :score, Integer, :default => 0

    def add_score(i = 1)
      increment(:score => i)
    end

    def self.print_score_board
      puts "\n", "="*40
      puts "PLAYER\t\t\tSCORE"
      puts "-"*40
      sort(:score.desc).all.each do |p|
        puts "#{p.screen_name}\t\t#{p.score}"
      end
      puts "="*40
    end

  end
end