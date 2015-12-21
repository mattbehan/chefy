class ProfilesController < ApplicationController

	before_filter :must_be_logged_in
	# before_filter :find_user
	before_filter :find_profile, except: [:create, :new]

	def show
	end

	def new
		@profile = Profile.new
	end

	def create
		# redirect_to :show unless current_user.profile = nil
		@profile = Profile.new( profile_create_params.merge(user_id: current_user.id, user_type: current_user.class.to_s) )
		if @profile.save
			redirect_to profile_path(current_user.profile)
		else
			render :new
		end
	end

	def edit
		must_be_owner(@profile.user_id, @profile.user_type)
	end

	def update
		must_be_owner(@profile.user_id, user_type)
		@profile.update(profile_update_params)
		if @profile.valid?
			redirect_to profile_path(current_user)
		else
			render :edit
		end
	end

	protected

	def profile_create_params
    params.require(:profile).permit(:name, :bio, :gender)
  end

	def profile_update_params
    params.require(:profile).permit(:name, :bio, :gender)
  end


end