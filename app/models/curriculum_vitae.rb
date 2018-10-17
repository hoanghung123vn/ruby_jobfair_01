class CurriculumVitae < ApplicationRecord
  has_many :user_curriculum_vitaes
  has_many :users, through: :user_curriculum_vitaes
  validates :target, :experience, presence: true
  validates :rank, :skill, presence: true, length: {minimum: Settings.min_rank, maximum: Settings.max_rank}
  validates :language, presence: true, length: {minimum: Settings.min_lang, maximum: Settings.max_lang}
end
