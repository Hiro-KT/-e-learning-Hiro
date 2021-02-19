class Admin::WordsController < ApplicationController


  def new
    @category = Category.find_by_id(params[:category_id])
    @word = Word.new
    3.times { @word.choices.build }
  end

  def create
    @category = Category.find_by_id(params[:category_id])
    @word = @category.words.new(word_params)

    if @word.save
      redirect_to admin_category_url(@category)
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find_by_id(params[:category_id])
    @word = Word.find(params[:id])
  end

  def word_params
    params.require(:word).permit(:content, choices_attributes: [ :id,  :content, :is_correct ] )
  end

end
