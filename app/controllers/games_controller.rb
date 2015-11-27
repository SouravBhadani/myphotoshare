class GamesController < ApplicationController
  before_action :authenticate_user! , only: [:index, :play, :hit_or_stand]
  def index   
  end

  def play
  	@game = Game.start(current_user)
  	@game_step = @game.steps.first
  end

  def hit_or_stand
  	@game = Game.find(params[:id])
    @step_type = params[:step_type]
    @card = @game.hit_or_stand(@step_type)
    @game.reload
    @game_completed = @game.completed?
  end

  def result
  end  

  def statitistics
     @games = Game.all
  end
end
