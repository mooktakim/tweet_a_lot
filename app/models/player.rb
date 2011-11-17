class Player

  include MongoMapper::Document

  key :twitter_id, Integer
  key :screen_name, String
  key :profile_image_url, String
  key :score, Integer, :default => 0

  def add_score(i = 1)
    increment(:score => i)
  end

  def self.score_board
    text = ["="*40, "PLAYER\t\t\tSCORE", "-"*40]
    sort(:score.desc).all.each do |p|
      text << "#{p.screen_name}\t\t#{p.score}"
    end
    text << "="*40
    text.join("\n")
  end

  def self.print_score_board
    puts "\n"
    puts score_board
  end

end