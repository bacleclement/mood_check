class QuestionsController < ApplicationController

  # def index
  # end

  # def show
  #   @question = Question.find(params_question)
  #   @thought_check = ThoughtCheck.find(params[:thought_check_id])
  # end

  def new
    @question = Question.new
    @thought_check = ThoughtCheck.find(params[:thought_check_id])
  end

  def create
    @question = Question.new(params_question)
    @thought_check = ThoughtCheck.find(params[:thought_check_id])
    @question.thought_check = @thought_check
    @user = User.find(current_user.id)
    if @question.save!
      redirect_to thought_check_path(@thought_check, @question)
    else
      render :new
    end
  end

  def edit
    @question = Question.find()
  end

  def update
  end

  def destroy
  end

  private

  def params_question
    params.require(:question).permit(:positive_proof, :negative_proof, :alternative, :worst_case, :best_case, :realistic, :thought_effect, :friend, :new_trust, :new_emotion, :new_emotion_level)
  end
end
