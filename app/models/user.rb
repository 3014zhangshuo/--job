class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  enum status:{ user: 0, moderator: 1 }

  ROLES = {0 => :user, 1 => :admin, 2 => :moderator, 3 => :recruiter}# cancancan use
  attr_reader :role
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :all_except, -> (user) {where.not(id: user)}
  has_many :works
  has_many :notifications
  has_many :resumes
  has_one :apply

  acts_as_messageable

  def mailboxer_email(object)
    email
  end

  def role?(role_name)
    role == role_name
  end

  def moderator?
    self.status == "moderator"
  end

  def recruiter?
    is_recruiter
  end

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
