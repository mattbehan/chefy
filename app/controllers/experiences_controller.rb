class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :edit, :update, :destroy]
  before_action :find_chef
  before_action :find_recipe


  # GET /experiences/1
  # GET /experiences/1.json
  def show
  end

  # GET /experiences/new/chef_id/recipe_id
  def new
    @chef_id = params[:chef_id]
    @recipe = params[:recipe]
    @chefs = Chef.all.map{|chef| chef.profile.name}
    @recipes = Recipe.all.pluck(:name)
    @specialties = Specialty.all
    @experience = Experience.new
  end

  # GET /experiences/1/edit
  def edit
  end

  # POST /experiences
  # POST /experiences.json
  def create
    @chef_id = Profile.find_by(name: experience_params[:chef], user_type: "Chef").user.id
    @recipe_id = Recipe.find_by(name: experience_params[:recipe]).id
    @experience = Experience.new(chef_id: @chef_id, recipe_id: @recipe_id, foody_id: current_foody.id, cost: Pricing.calculate(@recipe_id, @chef_id), status: "upcoming", starts_at: experience_params[:starts_at] )


    respond_to do |format|
      if @experience.save
        format.html { redirect_to @experience, notice: 'Experience was successfully created.' }
        format.json { render :show, status: :created, location: @experience }
      else
        format.html { render :new }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /experiences/1
  # PATCH/PUT /experiences/1.json
  def update
    respond_to do |format|
      if @experience.update(experience_params)
        format.html { redirect_to @experience, notice: 'Experience was successfully updated.' }
        format.json { render :show, status: :ok, location: @experience }
      else
        format.html { render :edit }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experiences/1
  # DELETE /experiences/1.json
  def destroy
    @experience.destroy
    respond_to do |format|
      format.html { redirect_to experiences_url, notice: 'Experience was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experience
      @experience = Experience.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def experience_params
       params.require(:experience).permit(:chef, :recipe, :starts_at)
    end
end
