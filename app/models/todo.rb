class Todo < ApplicationRecord
  has_many :tasks, dependent: :destroy

  include PgSearch::Model

  pg_search_scope :search_task,
    against: [ :name ],
    using: {
      tsearch: { prefix: true }
    }


  def tasks_completed
    self&.tasks.where(done: true).count
  end

  def completed?
    self&.tasks.pluck(:done).uniq.size > 1 ? false : true
  end
end
