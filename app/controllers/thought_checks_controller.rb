class ThoughtChecksController < ApplicationController

  # before_action :set_thought_check, :only [ :show, :edit, :update, :destroy ]
  # I didn't understand why this line of code break my app ?

  def index
    @thought_checks = ThoughtCheck.all
  end

  def show
    @thought_check = ThoughtCheck.find(params[:id])
    # I want to select only question about this thought
    @questions = Question.all.where(thought_check_id: params[:id])
    redirect_to new_thought_check_path unless @thought_check
  end

  def new
    session[:thought_checks_params] ||= {}
    @thought_check = ThoughtCheck.new
    @thought_check.current_step = session[:thought_check_step]
  end

  def create
    session[:thought_checks_params].deep_merge!(params[:thought_check]) if params[:thought_check]
    @thought_check = ThoughtCheck.new(session[:thought_checks_params])
    @thought_check.current_step = session[:thought_check_step]
    if params[:previous_button] == "Back"
      @thought_check.previous_step
    elsif @thought_check.last_step?
      @thought_check = session[:thought_checks_params]
      @thought_check.save
    else
      @thought_check.next_step
    end
    session[:thought_check_step] = @thought_check.current_step

    if @thought_check.new_record?
      render 'new'
    else
      flash[:notice] = "Pensée sauvegardée..."
      redirect_to @thought_check
    end
    # render 'new'
    # @profile = Profile.find(current_user.id)
    # @thought_check = ThoughtCheck.new(params_thought_check)
    # @thought_check.profile = @profile
    # if @thought_check.save
    #   redirect_to @thought_check
    # else
    #   render :new
    # end
  end

  def edit
    @thought_check = ThoughtCheck.find(params[:id])
  end

  def update
    @thought_check = ThoughtCheck.find(params[:id])
    @thought_check.update(params_thought_check)
    if @thought_check.save
      redirect_to thought_check_path
    else
      render :new
    end
  end

  def destroy
    @thought_check = ThoughtCheck.find(params[:id])
    @thought_check.destroy
  end

  private

  def params_thought_check
    params.permit(:situation, :about, :thought, :emotion, :emotion_level, :physiological, :trust)
  end

  # def set_thought_check
  #   @thought_check = ThoughtCheck.find(params[:id])
  # end
end
