class Public::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage, :update]
  before_action :set_user, only: [:mypage, :show, :update]

  def mypage
    @news = News.where(release_at: DateTime.new..Time.current).order(release_at: :desc).limit(3)
    have_authenticate?(@user)
  end

  def show

  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:profile_image, :login_id, :family_name,
                                :given_name, :family_name_kana, :given_name_kana,
                                :email, :post_id)
  end

  def set_user
    @user = User.find_by(login_id: params[:login_id])
  end
end
