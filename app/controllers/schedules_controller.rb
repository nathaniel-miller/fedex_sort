class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]
  before_filter :common_content, :only => [:new, :edit, :create]

  def common_content
    @user = current_user
    @sort_types = SortType.all
  end

  def index
    @schedules = Schedule.all
  end

  def show
  end

  def new
    @schedule = Schedule.new
    @sort_types = SortType.all
  end

  def edit
  end

  def create
    @schedule = Schedule.new(schedule_params)

    respond_to do |format|
      if @schedule.save
        @schedule.update(sort_params)

        format.html { redirect_to @schedule, notice: 'Schedule was successfully created.' }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url, notice: 'Schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(
      :start_date,
      :end_date,
      :user_id
    )
  end

  def sort_params
    # sort = params[:schedule][:sorts_attributes]["0"]
    # schedule = params[:schedule]
    #
    # sort["start_date(1i)"] = schedule["start_date(1i)"]
    # sort["start_date(2i)"] = schedule["start_date(2i)"]
    # sort["start_date(3i)"] = schedule["start_date(3i)"]
    # sort["end_date(1i)"]   = schedule["end_date(1i)"]
    # sort["end_date(2i)"]   = schedule["end_date(2i)"]
    # sort["end_date(3i)"]   = schedule["end_date(3i)"]

    params.require(:schedule).permit(
      :sorts_attributes => [:date, :sort_type_ids => []]
    )
  end
end
