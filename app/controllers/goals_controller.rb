class GoalsController < ApplicationController
  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      redirect_to root_url
    else
      render :new
    end
  end

  def goal_params
    params[:goal].permit!
  end
end
