class Work < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0}
  has_many :resumes, dependent: :destroy
  has_many :notifications, as: :notifiable
  belongs_to :user
end
