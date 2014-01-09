class GoalsController < ApplicationController
  def show
    render json: Goal.first
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      render json: {success: true, mark: @goal}
    else
      render json: {success: false}
    end
  end

  def goal_params
    params[:goal].permit!
  end
end
