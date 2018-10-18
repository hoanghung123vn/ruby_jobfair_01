class UserCurriculumVitae < ApplicationRecord
  belongs_to :user
  belongs_to :curriculum_vitae
end
