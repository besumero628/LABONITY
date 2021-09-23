class Public::LabimagesController < ApplicationController
  before_action :set_laboratory

  def create
    @labimage = LabImage.new(labimage_params)

    if @labimage.update(labimage_params)
      flash[:info] = "TopImageを追加しました！"
      redirect_to edit_public_laboratory_path(@set_laboratory.id)
    else
      @laboratory = Laboratory.new
      @labimage = LabImage.new
      @labimages = LabImage.where(laboratory_id: @set_laboratory.id)
      render 'public/laboratories/edit'
    end

  end

  def destroy
    @labimage = LabImage.find(params[:id])
    params[:laboratory_id] = @set_laboratory.id
    
    
    if @labimage.destroy
      flash[:info] = "SlideImageを削除しました！"
      redirect_to edit_public_laboratory_path(@set_laboratory.id)
    else
      flash[:danger] = "エラーです。"
      render "index"
    end
    
    
  end

  private
  def labimage_params
    params.require(:lab_image).permit(:image, :laboratory_id)
  end

end
