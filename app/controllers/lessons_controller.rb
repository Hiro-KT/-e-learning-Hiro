class LessonsController < ApplicationController

  def create
      @lesson = current_user.lessons.new(category_id: params[:category_id])
      @lesson.save
      redirect_to new_lesson_answer_url(@lesson)
  end

  def show
  end

  def lesson_params
    params.require(:lesson).permit( :result , :user_id , :category_id )
  end

end
