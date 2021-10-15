class Public::RelationshipsController < ApplicationController
  before_action :set_user, only:[:index, :create]
  
  def index
    
  end

  def create
    @follow_user = User.find(params[:follow_id])
    following = current_user.follow(@follow_user)
    if following.save
      flash[:info] = 'ユーザーをフォローしました'
      redirect_to public_user_path(@follow_user.login_id)
    else
      flash.now[:danger] = 'ユーザーのフォローに失敗しました'
      redirect_to public_user_path(@follow_user.login_id)
    end
  end

  def destroy
    @user = User.find_by(login_id: params[:id])
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:info] = 'ユーザーのフォローを解除しました'
      redirect_to public_user_path(@user.login_id)
    else
      flash.now[:danger] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to public_user_path(@user.login_id)
    end
  end
end
