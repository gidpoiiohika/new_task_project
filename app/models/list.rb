class List < ApplicationRecord
  has_many :tasks

  scope :list_name, lambda { |id| find_by(id: id).name }
end
