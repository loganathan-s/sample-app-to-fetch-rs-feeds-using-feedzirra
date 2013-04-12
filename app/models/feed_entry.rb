class FeedEntry < ActiveRecord::Base
  attr_accessible :author, :content, :guid, :published_at, :title, :url
  
  def self.update_from_feed
    feed = Feedzirra::Feed.fetch_and_parse(FEED_URL)
    # Update feed if content is changed
    feed = Feedzirra::Feed.update(feed)
    add_entries(feed.entries)
  end
  
  private
  
  def self.add_entries(entries)
    entries.each do |entry|
      unless exists? guid: entry.id
        create!(
	 title: entry.title,
	 content: entry.content,
	 url: entry.url,
	 author: entry.author,
	 published_at: entry.published,
	 guid: entry.id)
      end
    end
  end
end
