class AnswersController < ApplicationController
    before_action :require_login, only: %i[create edit update destroy]
    before_action :set_answer, only: %i[edit update destroy]

    def create
        answer = current_user.answers.build(answer_params)
        if answer.save
          redirect_to answer_question_answers_path, success: '回答しました'
        else
          redirect_to question_path(answer.question), success: '回答できませんでした'
        end
    end

    def edit
      @question = Question.find(@answer.question.id)
    end

    def update
        @answer.update(answer_update_params)
        redirect_to question_path(@answer.question)
    end

    def destroy
        @answer.destroy!
        redirect_to question_path(@answer.question)
    end

    def answer
      @question = Question.find(params[:question_id])
      @answers = @question.answers.includes(:user).order(created_at: :desc)
    end

    private
    def set_answer
      @answer = current_user.answers.find(params[:id])
    end

    def answer_params
        params.require(:answer).permit(:body).merge(question_id: params[:question_id])
    end

    def answer_update_params
        params.require(:answer).permit(:body)
    end
end
