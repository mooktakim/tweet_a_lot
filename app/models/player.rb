class Player

  include MongoMapper::Document
  include Keytar

  key :twitter_id, Integer
  key :screen_name, String
  key :profile_image_url, String
  key :score, Integer, :default => 0
  scope :scores, sort(:score.desc).limit(20)

  define_keys :scores

  def add_score(i = 1)
    increment(:score => i)
    reload
    clear_cache
  end

  def self.score_board
    text = ["="*40, "PLAYER\t\t\tSCORE", "-"*40]
    scores.each do |p|
      text << "#{p.screen_name}\t\t#{p.score}"
    end
    text << "="*40
    text.join("\n")
  end

  def self.print_score_board
    puts "\n"
    puts score_board
  end

  private

  def clear_cache
    Rails.cache.write(self.class.scores_key, self.class.scores.all.to_json)
    # Rails.cache.clear
    # Rails.cache.write(self.class.etag_key, SecureRandom.hex(10))
  end

end