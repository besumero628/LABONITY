class Public::CommunityMembersController < ApplicationController
  def create
    @community_member = CommunityMember.new(user_id: params[:user_id], community_id: params[:community_id],
                                            owner_status: false, permit_status: true)

    if @community_member.save
      flash[:info] = 'メンバー申請を行いました！'
      redirect_to public_community_path(params[:community_id])
    else
      flash[:danger] = '不明なエラーです！'
      redirect_to public_community_path(params[:community_id])
    end
  end

  def destroy
    @community_member = CommunityMember.find_by(user_id: params[:user_id], community_id: params[:community_id])

    if @community_member.destroy
      flash[:info] = 'コミュニティから退会しました！'
      redirect_to public_community_path(params[:community_id])
    else
      flash[:danger] = '不明なエラーです！'
      redirect_to public_community_path(params[:community_id])
    end
  end
end
