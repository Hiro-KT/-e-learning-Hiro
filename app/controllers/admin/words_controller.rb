class Admin::WordsController < ApplicationController

  def new
    @category = Category.find_by_id(params[:category_id])
    @word = Word.new
    3.times { @word.choices.build }
  end

end
