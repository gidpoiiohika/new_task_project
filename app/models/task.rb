class Task < ApplicationRecord
  has_paper_trail on: [:update]

  belongs_to :user
  belongs_to :list

  validates :description, presence: true 
  validates :title, presence: true 
  validates :priority, presence: true 

  enum priority: ['high', 'medium', 'low']

  scope :by_priority, lambda { in_order_of(:priority, %w[high medium low])}
  scope :not_deleted, -> { where(soft_deleted: false) }
  scope :task_count_created, lambda { where(created_at: Date.today.all_day).count }
  scope :task_count_updated, lambda { where(updated_at: Date.today.all_day).count }
  scope :current_user_task, lambda { where(user_id: Current.user.id)}
end
