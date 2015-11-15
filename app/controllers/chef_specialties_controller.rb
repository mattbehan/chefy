class ChefSpecialtiesController < ApplicationController
  before_action :set_chef_specialty, only: [:show, :edit, :update, :destroy]

  # GET /chef_specialties/new
  def new
    @chef_specialty = ChefSpecialty.new
  end

  # GET /chef_specialties/1/edit
  def edit
  end

  # POST /chef_specialties
  # POST /chef_specialties.json
  # change redirect to chef profile page
  def create
    @chef_specialty = ChefSpecialty.new(chef_specialty_params)

    respond_to do |format|
      if @chef_specialty.save
        format.html { redirect_to @chef_specialty, notice: 'Chef specialty was successfully created.' }
        format.json { render :show, status: :created, location: @chef_specialty }
      else
        format.html { render :new }
        format.json { render json: @chef_specialty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chef_specialties/1
  # PATCH/PUT /chef_specialties/1.json
  def update
    respond_to do |format|
      if @chef_specialty.update(chef_specialty_params)
        format.html { redirect_to @chef_specialty, notice: 'Chef specialty was successfully updated.' }
        format.json { render :show, status: :ok, location: @chef_specialty }
      else
        format.html { render :edit }
        format.json { render json: @chef_specialty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chef_specialties/1
  # DELETE /chef_specialties/1.json
  def destroy
    @chef_specialty.destroy
    respond_to do |format|
      format.html { redirect_to chef_specialties_url, notice: 'Chef specialty was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chef_specialty
      @chef_specialty = ChefSpecialty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chef_specialty_params
      params[:chef_specialty]
    end
end
