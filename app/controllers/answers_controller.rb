class AnswersController < ApplicationController
  def new
    @categories = Category.all
  end
end
