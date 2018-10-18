class Job < ApplicationRecord
  belongs_to :career
  has_many :user_jobs
  has_many :users, through: :user_jobs
  validates :title, presence: true, length: {minimum: Settings.min_title, maximum: Settings.max_title}
  validates :salary, :amount, presence: true, numericality: true
  validates :rank, :skill, presence: true, length: {minimum: Settings.min_rank, maximum: Settings.max_rank}
  validates :language, presence: true, length: {minimum: Settings.min_lang, maximum: Settings.max_lang}
  validates :experience, :description, presence: true
  validates :publish_date, :expiration_date, presence: true, date: true
end
