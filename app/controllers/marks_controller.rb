class MarksController < ApplicationController
  def index
    render json: Mark.all.sort_by(&:id).reverse
  end

  def create
    @mark = Mark.new(mark_params)
    if @mark.save
      render json: {success: true, mark: @mark}
    else
      render json: {success: false}
    end
  end

  def mark_params
    params[:mark].permit!
  end
end
