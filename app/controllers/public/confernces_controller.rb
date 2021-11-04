class Public::ConferncesController < ApplicationController
  before_action :set_laboratory
  before_action lambda {
    current_user_have_edit_status_for_this_lab?(Laboratory.find(@set_laboratory.id))
  }, only: %i[new edit]

  def index
    @confernces = Confernce.where(laboratory_id: @set_laboratory.id).order(created_at: :desc).page(params[:page])
  end

  def show
    @confernce = Confernce.find(params[:id])
  end

  def new
    @confernce = Confernce.new
  end

  def edit
    @confernce = Confernce.find(params[:id])
  end

  def create
    @confernce = Confernce.new(confernce_params)

    if @confernce.save
      flash[:info] = '学会を新規登録しました！'
      redirect_to public_laboratory_confernces_path(@set_laboratory.id)
    else
      render 'new'
    end
  end

  def update
    @confernce = Confernce.find(params[:id])

    if @confernce.update(confernce_params)
      flash[:info] = '学会を編集しました！'
      redirect_to public_laboratory_confernces_path(@set_laboratory.id)
    else
      render 'edit'
    end
  end

  def destroy
    @confernce = Confernce.find(params[:id])

    if @confernce.destroy
      flash[:info] = '学会を削除しました！'
      redirect_to public_laboratory_confernces_path(@set_laboratory.id)
    else
      flash[:danger] = 'エラーです。'
      render 'index'
    end
  end

  private

  def confernce_params
    params.require(:confernce).permit(:name, :title, :abstract, :figure, :linkpath, :laboratory_id)
  end
end
