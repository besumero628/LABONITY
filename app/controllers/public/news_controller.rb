class Public::NewsController < ApplicationController
  def index
    @news = News.where(release_at: DateTime.new..Time.current).order(release_at: :desc).page(params[:page])
  end

  def show
    @news = News.find(params[:id])
    if Time.current < @news.release_at
      raise ActiveRecord::RecordNotFound
    end
  end
end
