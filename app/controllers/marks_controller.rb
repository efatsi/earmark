class MarksController < ApplicationController
  def index
    @goal = Goal.first
    @mark = Mark.new
    @marks = Mark.all.reverse
  end

  def create
    @mark = Mark.new(mark_params)
    if @mark.save
      redirect_to root_url
    else
      render :new
    end
  end

  def mark_params
    params[:mark].permit!
  end
end
