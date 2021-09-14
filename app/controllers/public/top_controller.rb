class Public::TopController < ApplicationController
  def index
    @news = News.where(release_at: DateTime.new..Time.current).order(release_at: :desc).limit(5)
    
  end

  def ajax
    # url = 'http://feeds.nature.com/nature/rss/current'
    # url = 'http://feeds.nature.com/nmat/rss/current'
    # url = 'https://www.science.org/action/showFeed?type=axatoc&feed=rss&jc=science'
    # url = 'https://www.cell.com/cell/inpress.rss'
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    render plain: Hash.from_xml(response.body).to_json
  end
end
