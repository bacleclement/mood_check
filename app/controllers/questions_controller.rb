class QuestionsController < ApplicationController

  # def index
  # end

  def show
    @question = Question.find(params_question)
  end

  def new
    @thought_check = ThoughtCheck.find(params[:thought_check_id])
    @question = Question.new
  end

  def create
    @question = Question.new(params_question)
    @thought_check = ThoughtCheck.find(params[:thought_check_id])
    @question.thought_check = @thought_check
    if @question.save
      redirect_to @thought_check
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def params_question
    params.require(:question).permit()
  end
end
