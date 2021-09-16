class Public::TopController < ApplicationController
  def index
    @news = News.where(release_at: DateTime.new..Time.current).order(release_at: :desc).limit(5)
  end
end