class Career < ApplicationRecord
  has_many :jobs
  validates :name, presence: true, length: {maximum: Settings.max_length_name}
  validates :description, presence: true
end
