class GarmentsController < ApplicationController
  layout :layout_admin_or_user
  before_action :authenticate_admin!, except: [:show]
  before_action :set_garment, only: [:show, :edit, :update, :destroy]

  # GET /garments
  # GET /garments.json
  def index
    @garments = Garment.all
  end

  # GET /garments/1
  # GET /garments/1.json
  def show

  end

  # GET /garments/new
  def new
    @garment = Garment.new
  end

  # GET /garments/1/edit
  def edit
  end

  # POST /garments
  # POST /garments.json
  def create
    @garment = Garment.new(garment_params)

    respond_to do |format|
      if @garment.save
        format.html { redirect_to @garment, notice: 'Garment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @garment }
      else
        format.html { render action: 'new' }
        format.json { render json: @garment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /garments/1
  # PATCH/PUT /garments/1.json
  def update
    respond_to do |format|
      if @garment.update(garment_params)
        format.html { redirect_to @garment, notice: 'Garment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @garment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /garments/1
  # DELETE /garments/1.json
  def destroy
    @garment.destroy
    respond_to do |format|
      format.html { redirect_to admins_path }
      #format.html { redirect_to garments_url }
      format.json { head :no_content }
    end
  end

    protected

  def layout_admin_or_user
    if admin_signed_in?
      "admin"
    else
      "application"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_garment
      @garment = Garment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def garment_params
      # { garment: {style: 'xyz'} }
      params.require(:garment).permit(:style, :period, :genre, :material, :available_size, :quantity, :price, :description, :image1, :image2, :image3, :image4)
    end
end
