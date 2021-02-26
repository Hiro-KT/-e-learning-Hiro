class LessonsController < ApplicationController

  def create
    @lesson = current_user.lessons.new(category_id: params[:category_id])
    @lesson.save
    redirect_to new_lesson_answer_url(@lesson)
  end

  def show
    @answer = current_user.lessons.find_by(params[:category_id])
    @answers = @answer.words
  end

  def lesson_params
    params.require(:lesson).permit( :result , :user_id , :category_id )
  end

end
