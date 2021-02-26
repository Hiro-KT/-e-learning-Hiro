class Category < ApplicationRecord
  has_many :words, dependent: :destroy
  has_many :lessons, dependent: :destroy
  belongs_to :user_id

  def get_lesson
    lessons.where(user_id: current_user.id).last
  end

end
