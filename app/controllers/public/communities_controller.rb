class Public::CommunitiesController < ApplicationController
  def index
    @communities = Community.all.order(created_at: :desc).page(params[:page])
  end

  def show
    @community = Community.find(params[:id])
    @community_members = CommunityMember.where(community_id: @community.id)
    @community_message = CommunityMessage.new
    @community_messages = CommunityMessage.where(community_id: @community.id).order(created_at: :desc).limit(30)
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
      CommunityMember.new(community_id: @community.id, user_id: current_user.id, owner_status: true,
                          permit_status: true).save
      flash[:info] = '新規communityを作成しました！'
      redirect_to public_communities_path
    else
      render 'new'
    end
  end

  def update; end

  def destroy; end

  private

  def community_params
    params.require(:community).permit(:image, :name, :introduction)
  end
end
