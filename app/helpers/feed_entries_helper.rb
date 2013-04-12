module FeedEntriesHelper
def feed_content(content)
  content.gsub("\"", "'").html_safe	
end	
end
