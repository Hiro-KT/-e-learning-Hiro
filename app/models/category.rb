class Category < ApplicationRecord
  has_many :words, dependent: :destroy
  has_many :lessons, dependent: :destroy


  def get_lesson(current_user)
    lessons.where(user_id: current_user.id).last
  end

end
