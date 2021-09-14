class Public::RssChoicesController < ApplicationController

  def create
    rss_choice = RssChoice.new(user_id: current_user.id, rss_id: params[:rss_id])
    @rss = Rss.find(rss_choice.rss_id)
    rss_choice.save
  end

  def destroy
    rss_choice = RssChoice.find(params[:id])
    @rss = Rss.find(rss_choice.rss_id)
    rss_choice.destroy
  end

end
