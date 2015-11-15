class ProfileDietTagsController < ApplicationController
  before_action :set_profile_diet_tag, only: [:show, :edit, :update, :destroy]

  # GET /profile_diet_tags
  # GET /profile_diet_tags.json
  def index
    @profile_diet_tags = ProfileDietTag.all
  end

  # GET /profile_diet_tags/1
  # GET /profile_diet_tags/1.json
  def show
  end

  # GET /profile_diet_tags/new
  def new
    @profile_diet_tag = ProfileDietTag.new
  end

  # GET /profile_diet_tags/1/edit
  def edit
  end

  # POST /profile_diet_tags
  # POST /profile_diet_tags.json
  def create
    @profile_diet_tag = ProfileDietTag.new(profile_diet_tag_params)

    respond_to do |format|
      if @profile_diet_tag.save
        format.html { redirect_to @profile_diet_tag, notice: 'Profile diet tag was successfully created.' }
        format.json { render :show, status: :created, location: @profile_diet_tag }
      else
        format.html { render :new }
        format.json { render json: @profile_diet_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profile_diet_tags/1
  # PATCH/PUT /profile_diet_tags/1.json
  def update
    respond_to do |format|
      if @profile_diet_tag.update(profile_diet_tag_params)
        format.html { redirect_to @profile_diet_tag, notice: 'Profile diet tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile_diet_tag }
      else
        format.html { render :edit }
        format.json { render json: @profile_diet_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profile_diet_tags/1
  # DELETE /profile_diet_tags/1.json
  def destroy
    @profile_diet_tag.destroy
    respond_to do |format|
      format.html { redirect_to profile_diet_tags_url, notice: 'Profile diet tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile_diet_tag
      @profile_diet_tag = ProfileDietTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_diet_tag_params
      params[:profile_diet_tag]
    end
end
