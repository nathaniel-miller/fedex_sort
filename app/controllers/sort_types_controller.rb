class SortTypesController < ApplicationController
  before_action :set_sort_type, only: [:show, :edit, :update, :destroy]

  # GET /sort_types
  # GET /sort_types.json
  def index
    @sort_types = SortType.all
  end

  # GET /sort_types/1
  # GET /sort_types/1.json
  def show
  end

  # GET /sort_types/new
  def new
    @sort_type = SortType.new
  end

  # GET /sort_types/1/edit
  def edit
  end

  # POST /sort_types
  # POST /sort_types.json
  def create
    @sort_type = SortType.new(sort_type_params)

    respond_to do |format|
      if @sort_type.save
        format.html { redirect_to @sort_type, notice: 'Sort type was successfully created.' }
        format.json { render :show, status: :created, location: @sort_type }
      else
        format.html { render :new }
        format.json { render json: @sort_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sort_types/1
  # PATCH/PUT /sort_types/1.json
  def update
    respond_to do |format|
      if @sort_type.update(sort_type_params)
        format.html { redirect_to @sort_type, notice: 'Sort type was successfully updated.' }
        format.json { render :show, status: :ok, location: @sort_type }
      else
        format.html { render :edit }
        format.json { render json: @sort_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sort_types/1
  # DELETE /sort_types/1.json
  def destroy
    @sort_type.destroy
    respond_to do |format|
      format.html { redirect_to sort_types_url, notice: 'Sort type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sort_type
      @sort_type = SortType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sort_type_params
      params.require(:sort_type).permit(
        :name,
        :start_date,
        :end_date,
        :roster_id,
        :setup_id
      )
    end
end
