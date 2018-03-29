class TripTypesController < ApplicationController
  before_action :set_trip_type, only: [:show, :edit, :update, :destroy]

  # GET /trip_types
  # GET /trip_types.json
  def index
    @trip_types = TripType.all
  end

  # GET /trip_types/1
  # GET /trip_types/1.json
  def show
  end

  # GET /trip_types/new
  def new
    @trip_type = TripType.new
  end

  # GET /trip_types/1/edit
  def edit
  end

  # POST /trip_types
  # POST /trip_types.json
  def create
    @trip_type = TripType.new(trip_type_params)

    respond_to do |format|
      if @trip_type.save
        format.html { redirect_to @trip_type, notice: 'Trip type was successfully created.' }
        format.json { render :show, status: :created, location: @trip_type }
      else
        format.html { render :new }
        format.json { render json: @trip_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trip_types/1
  # PATCH/PUT /trip_types/1.json
  def update
    respond_to do |format|
      if @trip_type.update(trip_type_params)
        format.html { redirect_to @trip_type, notice: 'Trip type was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip_type }
      else
        format.html { render :edit }
        format.json { render json: @trip_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trip_types/1
  # DELETE /trip_types/1.json
  def destroy
    @trip_type.destroy
    respond_to do |format|
      format.html { redirect_to trip_types_url, notice: 'Trip type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip_type
      @trip_type = TripType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_type_params
      params.require(:trip_type).permit(:name)
    end
end
