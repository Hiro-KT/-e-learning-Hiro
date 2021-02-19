class Admin::WordsController < ApplicationController

  def show

  end

  def new
    @category = Category.find_by_id(params[:category_id])
    @word = Word.new
    3.times { @word.choices.build }
  end

  def create
    @words = Word.all(params[:category_id])
    @category = Category.find_by_id(params[:category_id])
    @word = @category.words.new(word_params)

    if @word.save
      redirect_to admin_category_url
    else
      render 'new'
    end
  end

  def word_params
    params.require(:word).permit(:content, choices_attributes: [ :id,  :content, :is_correct ] )
  end

end
