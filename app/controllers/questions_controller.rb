class QuestionsController < ApplicationController
  def index
    @questons = Question.all.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      redirect_to questions_path
    else
      render :new
    end
  end


  def edit
    @question = Question.find(params[:id])
  end

  def update
    question = Question.find(params[:id])
    question.update!(question_params)
    redirect_to questions_path
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to questions_url
  end

private

def question_params
  params.require(:question).permit(:title, :body, :hint, :keyword)
end
end
