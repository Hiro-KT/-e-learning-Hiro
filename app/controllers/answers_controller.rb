class AnswersController < ApplicationController

  def new
    @lesson = Lesson.find(params[:lesson_id])
    @word = @lesson.next_word
    @answer = Answer.new

    if @lesson.next_word.nil?
      @lesson.update(result: @lesson.correct_answers)
      @lesson.create_activity(user: current_user)

      redirect_to lesson_url(@lesson)
    end
  end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @answer = @lesson.answers.new(answer_params)
    @answer.save
    redirect_to new_lesson_answer_path(@answer.lesson)
  end


  def answer_params
    params.require(:answer).permit(:lesson_id , :word_id , :choice_id)
  end

end