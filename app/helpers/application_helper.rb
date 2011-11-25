module ApplicationHelper

  def display_tweet(msg)
    return nil if msg.blank?
    auto_link(msg.gsub(/#\w+/i, '<a href="https://twitter.com/#!/search?q=%23\0">\0</a>').gsub('%23#', '%23'), :link => :urls)
  end

end
