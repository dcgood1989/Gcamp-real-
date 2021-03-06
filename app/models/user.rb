class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :password_confirmation, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true

  has_many :projects, through: :memberships, dependent: :destroy
  has_many :memberships, dependent: :destroy


  has_many :comments


  def full_name
    "#{first_name} #{last_name}"
  end


  def membership(project)
    self.memberships.find_by(project_id: project.id) != nil
  end

  def membership_owner_or_admin(project)
    self.memberships.where(project_id: project.id, roles: 2).present? || self.admin
  end
end
