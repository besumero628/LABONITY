class Public::PressReleasesController < ApplicationController
  before_action :set_laboratory
  
  def show
    @press_release = PressRelease.find(params[:id])
  end

  def new
    @press_release = PressRelease.new
  end

  def edit
    @press_release = PressRelease.find(params[:id])
  end

  def create
    # render plain: params.inspect
    @press_release = PressRelease.new(press_releases_params)
    
    if @press_release.save
      flash[:info] = "PressReleaseを新規登録しました！"
      redirect_to public_laboratory_path(@set_laboratory.id)
    else
      flash[:danger] = "エラーです"
      render "new"
    end
    
  end

  def update
  end

  def destroy
  end

  private
  def press_releases_params
    params.require(:press_release).permit(:title, :body, :linkpath, :laboratory_id)
  end

end
