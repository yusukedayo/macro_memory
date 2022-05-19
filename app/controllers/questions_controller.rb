class QuestionsController < ApplicationController
before_action :set_question, only: [:show, :edit, :update, :destroy]
before_action :require_login, only: %i[new create edit update destroy]
  def index
    @questions = Question.all
  end

  def show;end

  def new
    @question = Question.new
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      redirect_to questions_path, success: '質問を作成しました'
    else
      flash.now[:danger] = '失敗しました'
      render :new
    end
  end


  def edit ;end

  def update
	if @question.update(question_params)
		redirect_to question_path(@question), success: '質問を更新しました'
	else
		flash.now[:danger] = '失敗しました'
		render :edit
	end
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end

private

  def question_params
    params.require(:question).permit(:title, :body, :hint, :keyword)
  end
  def set_question
  	@question = current_user.questions.find(params[:id])
  end
end
