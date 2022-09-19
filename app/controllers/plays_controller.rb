class PlaysController < ApplicationController
  before_action :set_learning, only: [:index,:create]

  def index
    @play = Play.new
    @answer = @play.answers.build
  end

  def create
    @play = Play.new(play_params)
    if @play.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def play_params
    params.require(:play).permit(
      answers_attributes: [:answer]
    ).merge(user_id: current_user.id, learning_id: params[:learning_id])
  end

  def set_learning
    @learning = Learning.find(params[:learning_id])
    @questions = @learning.questions
  end

end
