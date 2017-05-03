class PositionListsController < ApplicationController
  before_action :set_position_list, only: [:show, :edit, :update, :destroy]

  # GET /position_lists
  # GET /position_lists.json
  def index
    @position_lists = PositionList.all
  end

  # GET /position_lists/1
  # GET /position_lists/1.json
  def show
  end

  # GET /position_lists/new
  def new
    @position_list = PositionList.new
  end

  # GET /position_lists/1/edit
  def edit
  end

  # POST /position_lists
  # POST /position_lists.json
  def create
    @position_list = PositionList.new(position_list_params)

    respond_to do |format|
      if @position_list.save
        format.html { redirect_to @position_list, notice: 'Position list was successfully created.' }
        format.json { render :show, status: :created, location: @position_list }
      else
        format.html { render :new }
        format.json { render json: @position_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /position_lists/1
  # PATCH/PUT /position_lists/1.json
  def update
    respond_to do |format|
      if @position_list.update(position_list_params)
        format.html { redirect_to @position_list, notice: 'Position list was successfully updated.' }
        format.json { render :show, status: :ok, location: @position_list }
      else
        format.html { render :edit }
        format.json { render json: @position_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /position_lists/1
  # DELETE /position_lists/1.json
  def destroy
    @position_list.destroy
    respond_to do |format|
      format.html { redirect_to position_lists_url, notice: 'Position list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_position_list
      @position_list = PositionList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def position_list_params
      params.fetch(:position_list, {})
    end
end
