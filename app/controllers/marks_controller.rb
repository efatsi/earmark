class MarksController < ApplicationController
  def index
    if params[:query] == 'unsaved'
      render json: Mark.unsaved.sort_by(&:id).reverse
    else
      render json: Mark.all.sort_by(&:id).reverse
    end
  end

  def create
    @mark = Mark.new(mark_params)
    if @mark.save
      render json: {success: true, mark: @mark}
    else
      render json: {success: false}
    end
  end

  def update
    Mark.unsaved.update_all(:saved => true)
    render json: all_marks
  end

  def mark_params
    params[:mark].permit!
  end

  def all_marks
    Mark.all.sort_by(&:id).reverse
  end
end
