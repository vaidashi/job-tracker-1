class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category, optional: true
  has_many :comments
  has_many :job_tags
  has_many :tags, through: :job_tags

end
