class TeamMembersController < ApplicationController
  before_action :set_team_member, only: [:show, :edit, :update, :destroy]

  # GET /team_members
  # GET /team_members.json
  def index
    path = request.original_fullpath

    if path == "/employees"
      @team_members = TeamMember.all
    else
     @team_members = current_user.team_members
   end

  end

  # GET /team_members/1
  # GET /team_members/1.json
  def show
  end

  # GET /team_members/new
  def new
    @team_member = TeamMember.new
  end

  # GET /team_members/1/edit
  def edit
  end

  # POST /team_members
  # POST /team_members.json
  def create
    @user = current_user
    @team_member = TeamMember.new(team_member_params)
    @team_member.dates_unavailable = dates_unavailable
    respond_to do |format|
      if @team_member.save

        @user.team_members << @team_member

        format.html { redirect_to @team_member, notice: 'Team member was successfully created.' }
        format.json { render :show, status: :created, location: @team_member }
      else
        format.html { render :new }
        format.json { render json: @team_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /team_members/1
  # PATCH/PUT /team_members/1.json
  def update
    respond_to do |format|
      if @team_member.update(team_member_params) && @team_member.update(dates_unavailable: dates_unavailable)
        format.html { redirect_to @team_member, notice: 'Team member was successfully updated.' }
        format.json { render :show, status: :ok, location: @team_member }
      else
        format.html { render :edit }
        format.json { render json: @team_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /team_members/1
  # DELETE /team_members/1.json
  def destroy
    @team_member.destroy
    respond_to do |format|
      format.html { redirect_to team_members_url, notice: 'Team member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_dates_unavailable
    @team_member = TeamMember.new
    respond_to do |format|
      format.js
    end
  end

  def remove_dates_unavailable
    @id = params[:id]
    respond_to do |format|
      format.js
    end
  end

  def add_permanent_position
    @team_member = TeamMember.new
    respond_to do |format|
      format.js
    end
  end

  def remove_permanent_position
    @id = params[:id]
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_member
      @team_member = TeamMember.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_member_params
      # params.fetch(:team_member, {})
      params.require(:team_member).permit(
        :first_name,
        :last_name,
        :employee_number,
        :date_of_hire,
        :extra,
        :light_duty
      )
    end

    def dates_unavailable
      dates = []

      get_date_ids.each do |id|
        sd = params.require(id).permit(
          :unavailable_start_date
        )

        ed = params.require(id).permit(
          :unavailable_end_date
        )

        sd_year = sd["unavailable_start_date(1i)"]
        sd_month = sd["unavailable_start_date(2i)"]
        sd_day = sd["unavailable_start_date(3i)"]

        ed_year = ed["unavailable_end_date(1i)"]
        ed_month = ed["unavailable_end_date(2i)"]
        ed_day = ed["unavailable_end_date(3i)"]

        start_date = Date.parse("#{sd_year}/#{sd_month}/#{sd_day}")
        end_date = Date.parse("#{ed_year}/#{ed_month}/#{ed_day}")

        dates << [id, start_date, end_date]
      end

      dates
    end

    # def dates_unavailable
    #   dates = []
    #
    #   get_date_ids.each do |id|
    #     sd = params.require(id).permit(
    #       :unavailable_start_date
    #     )
    #
    #     ed = params.require(id).permit(
    #       :unavailable_end_date
    #     )
    #
    #     sd_year = sd["unavailable_start_date(1i)"]
    #     sd_month = sd["unavailable_start_date(2i)"]
    #     sd_day = sd["unavailable_start_date(3i)"]
    #
    #     ed_year = ed["unavailable_end_date(1i)"]
    #     ed_month = ed["unavailable_end_date(2i)"]
    #     ed_day = ed["unavailable_end_date(3i)"]
    #
    #     start_date = Date.parse("#{sd_year}/#{sd_month}/#{sd_day}")
    #     end_date = Date.parse("#{ed_year}/#{ed_month}/#{ed_day}")
    #
    #     ds = start_date..end_date
    #     dates += ds.to_a
    #   end
    #
    #   dates.uniq
    # end

    def get_date_ids
      ids = params.keys.select {|k| k.scan(/\D/).empty?}
    end
end
