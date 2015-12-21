class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  helper_method :find_chef, :find_recipe, :current_user, :find_profile, :must_be_logged_in, :must_be_owner, :owner?,

  def find_chef
  	@chef = params[:chef_id]
  end

  def find_recipe
  	@recipe = params[:recipe_id]
  end

  def current_user
    current_foody || current_chef
  end

  def find_profile
    @profile = Profile.find_by(id: params[:id])
  end

  def must_be_owner resource_users_id
    unless owner?(resource_users_id)
      flash[:alert] = "You are not authorized to take that action"
      redirect_to :back
    end
  end

  def owner? resource_users_id
    user_signed_in? && resource_users_id.to_i == current_user.id
  end

  def must_be_logged_in
    redirect_to new_user_session_path unless foody_signed_in? || chef_signed_in?
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
    devise_parameter_sanitizer.for(:sign_up) << :first_name
    devise_parameter_sanitizer.for(:sign_up) << :last_name
  end
end
