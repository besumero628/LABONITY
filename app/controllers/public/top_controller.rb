class Public::TopController < ApplicationController
  def index; end

  def ajax
    url = 'http://feeds.nature.com/nmat/rss/current?format=xml'
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    render plain: Hash.from_xml(response.body).to_json
  end
end
