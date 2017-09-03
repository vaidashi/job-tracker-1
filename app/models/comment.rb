class Comment < ApplicationRecord
  belongs_to :job
  validates :notes, presence: true
end
