class RoleusersController < ApplicationController
  before_action :set_roleuser, only: [:show, :edit, :update, :destroy]

  # GET /roleusers
  # GET /roleusers.json
  def index
    @roleusers = Roleuser.all
  end

  # GET /roleusers/1
  # GET /roleusers/1.json
  def show
  end

  # GET /roleusers/new
  def new
    @roleuser = Roleuser.new
  end

  # GET /roleusers/1/edit
  def edit
  end

  # POST /roleusers
  # POST /roleusers.json
  def create
    @roleuser = Roleuser.new(roleuser_params)

    respond_to do |format|
      if @roleuser.save
        format.html { redirect_to @roleuser, notice: 'Roleuser was successfully created.' }
        format.json { render :show, status: :created, location: @roleuser }
      else
        format.html { render :new }
        format.json { render json: @roleuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roleusers/1
  # PATCH/PUT /roleusers/1.json
  def update
    respond_to do |format|
      if @roleuser.update(roleuser_params)
        format.html { redirect_to @roleuser, notice: 'Roleuser was successfully updated.' }
        format.json { render :show, status: :ok, location: @roleuser }
      else
        format.html { render :edit }
        format.json { render json: @roleuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roleusers/1
  # DELETE /roleusers/1.json
  def destroy
    @roleuser.destroy
    respond_to do |format|
      format.html { redirect_to roleusers_url, notice: 'Roleuser was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roleuser
      @roleuser = Roleuser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def roleuser_params
      params.fetch(:roleuser, {})
    end
end
