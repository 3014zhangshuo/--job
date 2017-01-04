class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  enum status:{ user: 0, admin: 1 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :all_except, -> (user) {where.not(id: user)}
  has_many :works
  has_many :notifications
  has_many :resumes

  def admin?
   is_admin
  end

  def admin!
    self.is_admin = true
    self.save
  end

  def user!
    self.is_admin = false
    self.save
  end

end
