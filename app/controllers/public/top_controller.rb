class Public::TopController < ApplicationController
  def index
    @news = News.where(release_at: DateTime.new..Time.current).order(release_at: :desc).limit(5)
    # @papers = Paper.order("RANDOM()").limit(10)
    @papers = Paper.all.limit(10)
    @communities = Community.order("RANDOM()").limit(10)
    @events = Event.order("RANDOM()").limit(10)
  end
end