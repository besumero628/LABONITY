class Public::LablinksController < ApplicationController
  before_action :set_laboratory
  before_action lambda {
    current_user_have_edit_status_for_this_lab?(Laboratory.find(@set_laboratory.id))
  }, only: %i[new edit]

  def index
    @lablinks = LabLink.where(laboratory_id: @set_laboratory.id).order(created_at: :desc).page(params[:page])
  end

  def new
    @lablink = LabLink.new
  end

  def edit
    @lablink = LabLink.find(params[:id])
  end

  def create
    @lablink = LabLink.new(lablink_params)

    if @lablink.save
      flash[:info] = 'Linkを新規登録しました！'
      redirect_to public_laboratory_lablinks_path(@set_laboratory.id)
    else
      flash[:danger] = 'エラー！'
      render 'new'
    end
  end

  def update
    @lablink = LabLink.find(params[:id])

    if @lablink.update(lablink_params)
      flash[:info] = 'Linkを編集しました！'
      redirect_to public_laboratory_lablinks_path(@set_laboratory.id)
    else
      render 'edit'
    end
  end

  def destroy
    @lablink = LabLink.find(params[:id])

    if @lablink.destroy
      flash[:info] = 'Linkを削除しました！'
      redirect_to public_laboratory_lablinks_path(@set_laboratory.id)
    else
      flash[:danger] = 'エラーです。'
      render 'index'
    end
  end

  private

  def lablink_params
    params.require(:lab_link).permit(:name, :linkpath, :laboratory_id)
  end
end
