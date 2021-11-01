class Public::CommunityMessagesController < ApplicationController
  def create
    @message = CommunityMessage.new(community_message_params)

    if @message.save
      redirect_to public_community_path(params[:community_id])
    else
      redirect_to public_community_path(params[:community_id])
    end
  end

  private

  def community_message_params
    params.require(:community_message).permit(:user_id, :community_id, :body)
  end
end
