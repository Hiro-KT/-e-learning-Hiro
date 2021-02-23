class Admin::WordsController < ApplicationController

  def new
    @category = Category.find(params[:category_id])
    @word = Word.new
    3.times { @word.choices.build }
  end

  def create
    @category = Category.find(params[:category_id])
    @word = @category.words.new(word_params)

    if @word.save
      redirect_to admin_category_url(@category)
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:category_id])
    @word = Word.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @word = Word.find(params[:id])

    if @word.update(word_params)
      redirect_to admin_category_url(@category)
    else
      render :edit
    end

  end

  def destroy
    @category = Category.find(params[:category_id])
    @word = Word.find(params[:id])
    @word.destroy

    redirect_to admin_category_url(@category)

  end

  def word_params
    params.require(:word).permit(:content, choices_attributes: [ :id,  :content, :is_correct ] )
  end

end