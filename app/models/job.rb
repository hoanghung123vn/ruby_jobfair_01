class Job < ApplicationRecord
  belongs_to :career
  has_many :user_jobs, dependent: :destroy
  has_many :users, through: :user_jobs
  validates :title, presence: true, length: {maximum: Settings.max_length_title}
  validates :salary, :amount, presence: true, numericality: true
  validates :rank, :skill, presence: true,
    length: {maximum: Settings.max_length_rank}
  validates :language, presence: true,
    length: {maximum: Settings.max_length_lang}
  validates :experience, :description, presence: true
  validates :publish_date, :expiration_date, presence: true, date: true

  scope :selected,
    ->{select :id, :title, :salary, :experience, :expiration_date}
  scope :ordered, ->{order created_at: :desc}

  class << self
    def career_options
      @career_options = Career.all.map{|p| [p.name, p.id]}
    end
  end
end
