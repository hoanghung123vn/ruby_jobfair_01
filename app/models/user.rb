class User < ApplicationRecord
  has_many :user_curriculum_vitaes
  has_many :curriculum_vitaes, through: :user_curriculum_vitaes
  has_many :user_jobs
  has_many :jobs, through: :user_jobs
  validates :name, presence: true, length: {maximum: Settings.max_length_name}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.max_length_mail},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: Settings.min_length_pass}, allow_nil: true
  validates :birthday, presence: true, date: true
  validates :phone, presence: true, numericality: true, length: {minimum: Settings.min_length_phone, maximum: Settings.max_length_phone}
  validates :address, presence: true, length: {maximum: Settings.max_length_add}
  validates :role, presence: true, numericality: true, length: {maximum: Settings.role}
end
