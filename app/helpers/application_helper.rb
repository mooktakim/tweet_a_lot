module ApplicationHelper

  def display_tweet(msg)
    return nil if msg.blank?
    auto_link(msg.gsub(/@\w+/i, '<a href="https://twitter.com/\0">\0</a>').gsub('https://twitter.com/@', 'https://twitter.com/').gsub(/#\w+/i, '<a href="https://twitter.com/#!/search?q=%23\0">\0</a>').gsub('%23#', '%23'), :link => :urls)
  end

  def page_footer
    foot = "Copyright &copy; #{year_range(2011)} "
    foot += link_to("Restless Beings", 'http://www.restlessbeings.org/', :rel => "home")
    foot += ' is a UK Registered Charity (1135134) and '
    foot += link_to('registered office', 'http://www.restlessbeings.org/contact')
    #foot += ' is a non-profit organisation with charity status.<br/>Registered company limited by guarantee number: 06426671'
    foot.html_safe
  end

  def year_range( start_year = Time.now.year, separator = '-' )
    [start_year, Time.now.year].sort.uniq.join(separator)
  end

end
