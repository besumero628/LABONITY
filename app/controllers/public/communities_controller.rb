class Public::CommunitiesController < ApplicationController
  
  def index
    @communities = Community.all.order(created_at: :desc).page(params[:page])
  end
  
  def show
    @community = Community.find(params[:id])
  end
  
  def new
    @community = Community.new
  end
  
  def edit
    @community = Community.find(params[:id])
  end
  
  def create
    @community = Community.new(community_params)
    if @community.save
      flash[:info] = "新規communityを作成しました！"
      redirect_to public_communities_path
    else
      render "new"
    end
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  def community_params
    params.require(:community).permit(:image, :name, :introduction)
  end
  
end
