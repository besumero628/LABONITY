class Public::LabStatusesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  
  def index
    @user_enrolled_labmember = LabMember.where(user_id: @user.id)
  end
  
end
