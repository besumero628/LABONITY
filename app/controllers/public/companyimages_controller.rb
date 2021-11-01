class Public::CompanyimagesController < ApplicationController
  before_action :set_company

  def create
    @companyimage = CompanyImage.new(companyimage_params)

    if @companyimage.update(companyimage_params)
      flash[:info] = 'TopImageを追加しました！'
      redirect_to edit_public_company_path(@set_company.id)
    else
      @companyimage = CompanyImage.new
      @companyimages = CompanyImage.where(company_id: @set_company.id)
      render 'public/companies/edit'
    end
  end

  def destroy
    @companyimage = CompanyImage.find(params[:id])
    params[:company_id] = @set_company.id

    if @companyimage.destroy
      flash[:info] = 'SlideImageを削除しました！'
      redirect_to edit_public_company_path(@set_company.id)
    else
      flash[:danger] = 'エラーです。'
      render 'public/companies/edit'
    end
  end

  private

  def companyimage_params
    params.require(:company_image).permit(:image, :company_id)
  end
end
