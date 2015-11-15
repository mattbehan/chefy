class RecipesDietTagsController < ApplicationController
  before_action :set_recipes_diet_tag, only: [:show, :edit, :update, :destroy]

  # GET /recipes_diet_tags
  # GET /recipes_diet_tags.json
  def index
    @recipes_diet_tags = RecipesDietTag.all
  end

  # GET /recipes_diet_tags/1
  # GET /recipes_diet_tags/1.json
  def show
  end

  # GET /recipes_diet_tags/new
  def new 
    @recipes_diet_tag = RecipesDietTag.new
  end

  # GET /recipes_diet_tags/1/edit
  def edit
  end

  # POST /recipes_diet_tags
  # POST /recipes_diet_tags.json
  def create
    @recipes_diet_tag = RecipesDietTag.new(recipes_diet_tag_params)

    respond_to do |format|
      if @recipes_diet_tag.save
        format.html { redirect_to @recipes_diet_tag, notice: 'Recipes diet tag was successfully created.' }
        format.json { render :show, status: :created, location: @recipes_diet_tag }
      else
        format.html { render :new }
        format.json { render json: @recipes_diet_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes_diet_tags/1
  # PATCH/PUT /recipes_diet_tags/1.json
  def update
    respond_to do |format|
      if @recipes_diet_tag.update(recipes_diet_tag_params)
        format.html { redirect_to @recipes_diet_tag, notice: 'Recipes diet tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipes_diet_tag }
      else
        format.html { render :edit }
        format.json { render json: @recipes_diet_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes_diet_tags/1
  # DELETE /recipes_diet_tags/1.json
  def destroy
    @recipes_diet_tag.destroy
    respond_to do |format|
      format.html { redirect_to recipes_diet_tags_url, notice: 'Recipes diet tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipes_diet_tag
      @recipes_diet_tag = RecipesDietTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipes_diet_tag_params
      params[:recipes_diet_tag]
    end
end
