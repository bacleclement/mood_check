class ProfilesController < ApplicationController

  before_action :set_profile, only: [ :show, :edit, :update, :destroy ]

  def show
    redirect_to new_profile_path unless @profile
  end

  def new
    @profile = Profile.new
  end

  def create
    @user = User.find(current_user.id)
    @profile = Profile.new(params_profile)
    @profile.user = @user
    if @profile.save
      redirect_to profile_path(@user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @profile.update(params_profile)
    if @profile.save
      redirect_to profile_path(@user)
    else
      render :new
    end
  end

  def destroy
    @profile.destroy
  end

  private

  def params_profile
    params.require(:profile).permit(:username, :age, :gender)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end
end
