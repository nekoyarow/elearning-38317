class LearningsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]
  before_action :set_learning, only:[:show, :edit, :update, :destroy]

  def index
    @learnings = Learning.order(schedule_at: 'DESC')
  end

  def new
    @learning = Learning.new
    @questions = @learning.questions.build
  end

  def create
    @learning = Learning.new(learning_params)
    if @learning.save
      redirect_to learning_path(@learning.id)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @learning.update(learning_params)
      redirect_to learning_path(@learning.id), notice: "問題を登録しました。"
    else
      render :edit
    end
  end

  def destroy
    @learning.destroy
    redirect_to root_path
  end

  private

  def learning_params
    params.require(:learning).permit(:title, :category_id, :schedule_at, :comment,
      questions_attributes: [:id, :question, :is_answer_1, :content_1, :is_answer_2, :content_2, :description, :learning_id, :_destroy]
    ).merge(user_id: current_user.id)
  end

  def set_learning
    @learning = Learning.find(params[:id])
    @questions = @learning.questions
  end
  
end
