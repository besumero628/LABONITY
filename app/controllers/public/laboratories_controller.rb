class Public::LaboratoriesController < ApplicationController
  before_action :set_laboratory, except: [:index, :new]
  before_action ->{
    current_user_have_edit_status_for_this_lab?(Laboratory.find(@set_laboratory.id))
  }, only: [:edit, :permit]

  def index
    @laboratories = Laboratory.all.order(created_at: :desc).page(params[:page])
  end

  def show
    @laboratory = Laboratory.find(params[:id])
    @labimages = LabImage.where(laboratory_id: @set_laboratory.id)
    @press_releases = PressRelease.where(laboratory_id: @laboratory.id).order(created_at: :desc).page(params[:page])
  end

  def new
    @laboratory = Laboratory.new
  end

  def edit
    @laboratory = Laboratory.new
    @labimages = LabImage.where(laboratory_id: @set_laboratory.id)
    @labimage = LabImage.new
  end

  def create
    @laboratory = Laboratory.new(laboratory_params)

    if @laboratory.save
      @lab_member = LabMember.new(user_id: current_user.id, laboratory_id: @laboratory.id, post_id: current_user.post_id, edit_status: true, permit_status: true)
      @lab_member.save
      flash[:success] = "研究室を新規登録しました！"
      redirect_to public_laboratories_path
    else
      flash.now[:danger] = "エラーです"
      render "new"
    end
  end

  def update
    @laboratory = Laboratory.find(params[:id])

    if @laboratory.update(laboratory_params)
      flash[:info] = "研究室情報を編集しました！"
      redirect_to public_laboratory_path(@set_laboratory.id)
    else
      render "edit"
    end
  end

  def destroy
  end

  def member
    @lab_members = LabMember.where(laboratory_id: @set_laboratory.id)
  end
  
  def permit
    @lab_member = LabMember.find(params[:key])
    if @lab_member.update(permit_status: true)
      flash[:info] = "メンバーを許可しました"
      redirect_to public_laboratory_member_path(@set_laboratory.id)
    else
      render "member"
    end
  end

  private
  def laboratory_params
    params.require(:laboratory).permit(:name, :introduction, :organization_type, :organization_id,
                                       :major_id, :official_mark_status, :close_status)
  end

end
