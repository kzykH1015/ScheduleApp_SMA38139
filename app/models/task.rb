class Task < ApplicationRecord
  validates :task_title, presence: true
  validates :task_memo, presence: true
  validates :task_time, presence: true
end
