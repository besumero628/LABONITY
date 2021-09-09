class Public::TopController < ApplicationController
  def index
    @news = News.order(release_at: :desc).limit(5)
  end

  def ajax
    url = 'http://feeds.nature.com/nmat/rss/current?format=xml'
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    render plain: Hash.from_xml(response.body).to_json
  end
end
