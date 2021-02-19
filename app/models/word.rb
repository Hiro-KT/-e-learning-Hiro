class Word < ApplicationRecord
  belongs_to :category
  has_many :choices
  accepts_nested_attributes_for :choices

  def correct_answer
    # use "find_by" method for "choices" to find the choice where "is_correct" is true
    choices.find_by(is_correct: true)
  end

end
