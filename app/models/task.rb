class Task < ApplicationRecord
validates_presence_of :title, :content, :deadline, :status, :priority
  enum status: {not_started_yet: 0, get_started: 1, finished: 2}
  enum priority: {low: 0, medium: 1, high: 2}
end
