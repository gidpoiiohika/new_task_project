class User < ApplicationRecord
  rolify
  
  after_create :assign_default_role

  devise :database_authenticatable, :registerable, :rememberable, :validatable

  def assign_default_role
    self.add_role(:author_task) if self.roles.blank?
  end
end
