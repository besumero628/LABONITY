class Public::RssesController < ApplicationController
  before_action :set_user, only: [:index]
  
  def index
    @rsses = Rss.all.order(:name)
    have_authenticate?(@user)
  end
  
  def ajax1
    url = Rss.find(1).url
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    render plain: Hash.from_xml(response.body).to_json
  end
  
  def ajax2
    url = Rss.find(2).url
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    render plain: Hash.from_xml(response.body).to_json
  end
  
  def ajax3
    url = Rss.find(3).url
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    render plain: Hash.from_xml(response.body).to_json
  end
  
  def ajax4
    url = Rss.find(4).url
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    render plain: Hash.from_xml(response.body).to_json
  end
  
  def ajax5
    url = Rss.find(5).url
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    render plain: Hash.from_xml(response.body).to_json
  end
  
  private
  def set_user
    @user = User.find_by(login_id: params[:user_login_id])
  end
  
end
