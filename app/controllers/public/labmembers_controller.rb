class Public::LabmembersController < ApplicationController
  before_action :set_laboratory

  def create
    @labmember = LabMember.new(user_id: current_user.id, laboratory_id: @set_laboratory.id,
                               post_id: current_user.post_id)

    if @labmember.save
      flash[:info] = 'メンバー申請を行いました！'
      redirect_to public_laboratory_path(@set_laboratory.id)
    else
      flash[:danger] = 'エラー！'
      render 'new'
    end
  end
end
