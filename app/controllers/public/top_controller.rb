class Public::TopController < ApplicationController
  def index
    @news = News.where(release_at: DateTime.new..Time.current).order(release_at: :desc).limit(5)
    @papers = Paper.all.order(created_at: :desc).limit(10)
    @communities = Community.all.order(created_at: :desc).limit(10)
    @events = Event.all.order(created_at: :desc).limit(10)
  end
  
  def faq
    @faq = Faq.all
  end
end