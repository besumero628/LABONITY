class Public::LaboratoriesController < ApplicationController
  before_action :set_laboratory, except: [:index]
  
  def index
    @laboratories = Laboratory.all.order(created_at: :desc).page(params[:page])
  end
  
  def show
    @laboratory = Laboratory.find(params[:id])
    @press_releases = PressRelease.where(laboratory_id: @laboratory.id)
  end
  
  def new
  end
  
  def edit
  end
  
  def create
  end
  
  def update
  end
  
  def destroy
  end
  
  def member
    @lab_members = LabMember.where(laboratory_id: @set_laboratory.id)
  end
  
  private
  def labonity_params
    
  end
  
end
