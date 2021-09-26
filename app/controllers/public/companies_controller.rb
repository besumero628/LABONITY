class Public::CompaniesController < ApplicationController
  before_action :set_company, except: [:index, :new]
  def index
    @companies = Company.all.order(created_at: :desc).page(params[:page])
  end
  
  def show
    @companyimages = CompanyImage.where(company_id: @set_company.id)
    @events = Event.where(company_id: @set_company.id).order(created_at: :desc).page(params[:page])
  end
  
  def edit
    @companyimage = CompanyImage.new
    @companyimages = CompanyImage.where(company_id: @set_company.id)
  end

end
