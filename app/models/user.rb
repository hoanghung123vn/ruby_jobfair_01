class User < ApplicationRecord
  has_many :user_curriculum_vitaes
  has_many :curriculum_vitaes, through: :user_curriculum_vitaes
  has_many :user_jobs
  has_many :jobs, through: :user_jobs
  validates :name, presence: true, length: {maximum: Settings.max_name}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.max_mail},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: Settings.min_pass},
    allow_nil: true
  validates :birthday, presence: true, date: true
  validates :gender, length: {minimum: Settings.min_gen, maximum: Settings.max_gen}
  validates :phone, presence: true, numericality: true, length: {minimum: Settings.min_phone, maximum: Settings.max_phone}
  validates :address, presence: true, length: {minimum: Settings.min_add, maximum: Settings.max_add}
  validates :role, presence: true, numericality: true, length: {maximum: Settings.role}
end
