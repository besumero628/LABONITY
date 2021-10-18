class Public::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage, :update]
  before_action :set_user, only: [:mypage, :show, :update]

  def mypage
    @schedules = Schedule.where(affiliation_type: "Laboratory", affiliation_id: user_enroll_all_laboratories)
    @news = News.where(release_at: DateTime.new..Time.current).order(release_at: :desc).limit(3)
    @laboratories = LabMember.where(user_id: @user.id)
    @press_releases = PressRelease.where(laboratory_id: user_enroll_all_laboratories).order(created_at: :desc).limit(3)
    @rsses = User.find(current_user.id).rsses
    @communities = @user.communities
    have_authenticate?(@user)
  end

  def show
    @lab_user = LabMember.find_by(user_id: User.find_by(login_id: params[:login_id]).id, permit_status: true)
    @communities = @user.communities
    @papers = Paper.all
    @confernces = Confernce.all
    @books = Book.all
    @relationship = Relationship.new

    if @lab_user
      @laboratory = Laboratory.find(@lab_user.laboratory_id)
    else
      @laboratory = false
    end

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

  def user_enroll_all_laboratories
    @all_enroll_labs = []
    @enroll_labs = LabMember.where(user_id: current_user.id, enrolled_status: true, permit_status: true)
    @enroll_labs.each do |el|
      if !@all_enroll_labs.include?(el.laboratory_id)
        @all_enroll_labs << el.laboratory_id
      end
    end

    return @all_enroll_labs

  end

end
