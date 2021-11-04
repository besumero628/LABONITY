class Public::AccessesController < ApplicationController
  before_action :set_laboratory
  before_action lambda {
    current_user_have_edit_status_for_this_lab?(Laboratory.find(@set_laboratory.id))
  }, only: %i[new edit]

  def index
    @access = Access.find_by(organization_type: 'College', organization_id: params[:laboratory_id])
  end

  def new
    @access = Access.new
    if have_access?
      flash[:danger] = '住所は登録済みです'
      redirect_to public_laboratory_accesses_path(@set_laboratory.id)
    end
  end

  def edit
    @access = Access.find(params[:id])
  end

  def create
    @access = Access.new(access_params)

    if @access.save
      flash[:info] = '住所を新規登録しました！'
      redirect_to public_laboratory_accesses_path(@set_laboratory.id)
    else
      render 'new'
    end
  end

  def update
    @access = Access.find(params[:id])

    if @access.update(access_params)
      flash[:info] = '住所を編集しました！'
      redirect_to public_laboratory_accesses_path(@set_laboratory.id)
    else
      render 'edit'
    end
  end

  private

  def access_params
    params.require(:access).permit(:postal_code, :prefecture, :city, :address1, :address1, :address2,
                                   :organization_type, :organization_id)
  end

  def have_access?
    Access.find_by(organization_type: 'College', organization_id: @set_laboratory.id) ? true : false
  end
end
