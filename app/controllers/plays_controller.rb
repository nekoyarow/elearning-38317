class PlaysController < ApplicationController
  before_action :set_learning, only: [:index, :create]

  def index
    @play = Play.new
    @answer = @play.answers.build
  end

  def create
    @play = current_user.plays.new(play_params)
    play_count = Play.where(learning_id: params[:learning_id]).where(user_id: current_user.id).count
    if @play.valid?
      if play_count < 1
        @play.save
        redirect_to root_path, notice: "回答を保存しました"
      else
        redirect_to root_path, notice: "回答の送信は一人一回までです"
      end
    else
        render :index
    end
  end

  def show
    
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
