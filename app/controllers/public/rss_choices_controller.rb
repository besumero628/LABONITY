class Public::RssChoicesController < ApplicationController

  def create
    @rss_choice = RssChoice.new(user_id: current_user.id, rss_id: params[:rss_id])
    @rss = Rss.find(@rss_choice.rss_id)
    unless @rss_choice.save
      render 'public/rss_choices/error' #jsを見にいく
    end
  end

  def destroy
    rss_choice = RssChoice.find(params[:id])
    @rss_choice = rss_choice.dup #shallow copyで@rss_choiceを作成（validation error ajax用）
    @rss = Rss.find(rss_choice.rss_id)
    rss_choice.destroy
  end

end
