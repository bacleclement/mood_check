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
    @thought_check = ThoughtCheck.new
  end

  def create
    @profile = Profile.find(current_user.id)
    @thought_check = ThoughtCheck.new(params_thought_check)
    @thought_check.profile = @profile
    if @thought_check.save
      redirect_to @thought_check
    else
      render :new
    end
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
    params.require(:thought_check).permit(:situation, :type, :thought, :emotion, :emotion_level, :about, :physiological, :negative_proof, :positive_proof, :trust)
  end

  # def set_thought_check
  #   @thought_check = ThoughtCheck.find(params[:id])
  # end
end
