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
    @sort_types = @schedule.sort_types.sort_by { |type| type.start_time }
    @sorts = @schedule.sorts
    @date_group = date_group
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
        # @schedule.update(sort_params)
        @schedule.create_sorts

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
      :user_id,
      :sort_type_ids => []
    )
  end

  def sort_params
    params.require(:schedule).permit(
      :sorts_attributes => [:date]
    )
  end

  def date_group
    dates = @schedule.dates.to_a
    count = dates.count

    if count > 7
      dgc = date_group_count(count)
      date_group = Array.new(dgc, [])
      index = 0

      dgc.times do |i|
        date_group[i] = dates.slice(index, 7)
        index += 7
      end

    else
      date_group = [dates]
    end


    date_group
  end

  def date_group_count(count)
    count % 7 > 0 ? left_over = 1: left_over = 0
    core = count / 7

    core + left_over
  end
end
