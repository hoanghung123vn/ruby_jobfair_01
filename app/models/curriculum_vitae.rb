class CurriculumVitae < ApplicationRecord
  has_many :user_curriculum_vitaes, dependent: :destroy
  has_many :users, through: :user_curriculum_vitaes, dependent: :destroy

  validates :target, :experience, presence: true
  validates :skill, presence: true, length: {maximum: Settings.max_length_rank}
  validates :language, presence: true,
    length: {maximum: Settings.max_length_lang}
end
