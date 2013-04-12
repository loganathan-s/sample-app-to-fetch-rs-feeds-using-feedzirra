class FeedEntriesController < ApplicationController
  before_filter :fetch_feeds, only: :index
  
  # Display feeds in chronological order
  def index
     @feed_entries =  FeedEntry.select([:id, :title]).paginate(:page => params[:page], :per_page => NUMBER_OF_FEEDS_PER_PAGE).order( "published_at DESC")
  end

# Retrieve feed content
  def show
    @feed_entry = FeedEntry.select([:id, :content]).where(id: params[:id]).first
  end
  
  private
  # Fetch RSS feeds
  def fetch_feeds
    FeedEntry.update_from_feed
  end
	  
end
