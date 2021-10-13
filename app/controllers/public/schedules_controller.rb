class Public::SchedulesController < ApplicationController
  before_action :set_laboratory

  def index
    @schedules = Schedule.where(affiliation_type: "Laboratory", affiliation_id: @set_laboratory.id)
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)

    if @schedule.save
      flash[:info] = "予定を新規登録しました！"
      redirect_to public_laboratory_schedules_path(@set_laboratory.id)
    else
      flash[:danger] = "エラーです。正しく入力してください。"
      @schedules = Schedule.where(affiliation_type: "Laboratory", affiliation_id: @set_laboratory.id)
      render "index"
    end
  end
  
  def destroy
    @schedule = Schedule.find(params[:id])
    
    if @schedule.destroy
      flash[:info] = "予定を削除しました！"
      redirect_to public_laboratory_schedules_path(@set_laboratory.id)
    else
      flash[:danger] = "エラーです。"
      @schedules = Schedule.where(affiliation_type: "Laboratory", affiliation_id: @set_laboratory.id)
      render "index"
    end
  end

  private
  def schedule_params
    params.require(:schedule).permit(:title, :introduction, :start_time, :affiliation_type, :affiliation_id, :secret_status)
  end

end
