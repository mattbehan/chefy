class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :find_chef, :find_recipe

  def find_chef
  	@chef = params[:chef_id]
  end

  def find_recipe
  	@recipe = params[:recipe_id]
  end
end
