class LearningsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    
  end

  def new
    @learning = Learning.new
    @questions = @learning.questions.build
    @choices = @questions.choices.build
  end

  def create
    @learning = Learning.new(learning_params)
    if @learning.save
      redirect_to learnings_path
    else
      render :new
    end
  end

  private

  def learning_params
    params.require(:learning).permit(:title, :category_id, :comment,
      questions_attributes: [:question,:description, :_destroy,
        choices_attributes: [:content, :is_answer, :_destroy]
      ]
    ).merge(user_id: current_user.id)
  end
  
end
