class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]
  # before_action :update_sort_dates, only: [:create, :update]
  # GET /schedules
  # GET /schedules.json
  def index
    @schedules = Schedule.all
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
  end

  # GET /schedules/new
  def new
    @user = current_user
    # @sorts = Sort.all
    @sort_types = SortType.all
    @schedule = Schedule.new
  end

  # GET /schedules/1/edit
  def edit
    @user = current_user
    @sort_types = SortType.all
  end

  # POST /schedules
  # POST /schedules.json
  def create
    byebug
    @schedule = Schedule.new(schedule_params)
    @schedule.generate_responsibilites if @schedule.valid?

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to @schedule, notice: 'Schedule was successfully created.' }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
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

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url, notice: 'Schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # def update_sort_dates
    #   byebug
    #   schedule_params[:sorts_attributes]["0"]["start_date(1i)"] = schedule_params["start_date(1i)"]
    #   schedule_params[:sorts_attributes]["0"]["start_date(2i)"] = schedule_params["start_date(2i)"]
    #   schedule_params[:sorts_attributes]["0"]["start_date(3i)"] = schedule_params["start_date(3i)"]
    #
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      sort = params[:schedule][:sorts_attributes]["0"]
      schedule = params[:schedule]

      sort["start_date(1i)"] = schedule["start_date(1i)"]
      sort["start_date(2i)"] = schedule["start_date(2i)"]
      sort["start_date(3i)"] = schedule["start_date(3i)"]
      sort["end_date(1i)"]   = schedule["end_date(1i)"]
      sort["end_date(2i)"]   = schedule["end_date(2i)"]
      sort["end_date(3i)"]   = schedule["end_date(3i)"]

      params.require(:schedule).permit(
        :start_date,
        :end_date,
        :user_id,
        :sorts_attributes => [:start_date, :end_date, :sort_type_ids => []]
      )
    end
end
