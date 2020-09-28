class Todo < ApplicationRecord
  date_flag :compleled_at
  date_flag :deleted_at

  validates :title, :description, :priority, presence: true

  scope :incomplete, -> { where(completed_at: nil) }
  scope :completed, -> { where.not(completed_at: nil) }
  scope :active, -> { where(deleted_at: nil) }
  scope :deleted, -> { where.not(deleted_at: nil) }

  def self.todo_counter
    hash = Hash.new(0)
    self.active.incomplete.each { |list| hash[list.priority] += 1 }
    hash
  end
end
