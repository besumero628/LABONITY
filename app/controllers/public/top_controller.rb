class Public::TopController < ApplicationController
  def index
    @news = News.where(release_at: DateTime.new..Time.current).order(release_at: :desc).limit(5)
    raise IpAddressRejected
  end

  def ajax
    url = 'http://feeds.nature.com/nmat/rss/current?format=xml'
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    render plain: Hash.from_xml(response.body).to_json
  end
end
