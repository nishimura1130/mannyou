class Task < ApplicationRecord
  validates_presence_of :title, :content, :deadline, :status, :priority

  enum status: {not_started_yet: 0, get_started: 1, finished: 2}
  enum priority: {low: 0, medium: 1, high: 2}

  scope :get_search_title, -> (title_search) {
    return if title_search.blank?
    where(['title LIKE ?', "%#{title_search}%"])
  }

  scope :get_search_status, -> (status_search) {
    return if status_search.blank?
    where(status: status_search)
  }

  scope :get_search_result, -> (title_search, status_search) {
    get_search_title(title_search).get_search_status(status_search)
  }
end